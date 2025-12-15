CREATE TABLE fact_daily_prices(
  date DATE,
  company_id VARCHAR(20),
  open FLOAT,
  high FLOAT,
  low FLOAT,
  volume INT,
  calender_id INT,
  cumulative_factor FLOAT,
  adjusted_close FLOAT,
  avg_vol FLOAT,
  is_volume_support BOOLEAN,
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE fact_divdends(
  date DATE,
  company_id VARCHAR(20),
  divident_per_share FLOAT,
  calender_id INT,
  exchange_id VARCHAR(20),
  is_orphan_dividend BOOLEAN,
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (exchange_id) 
    REFERENCES dim_exchange(exchange_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE fact_splits(
  company_id VARCHAR(20),
  date DATE,
  split_ratio FLOAT,
  calender_id INT,
  exchange_id VARCHAR(20),
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (exchange_id) 
    REFERENCES dim_exchange(exchange_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE fact_orders(
  order_id VARCHAR(20) PRIMARY KEY,
  order_ts DATE,
  company_id VARCHAR(20),
  side ENUM('BUY','SELL'),
  quantity INT,
  Status ENUM('FILLED'),
  order_type ENUM('MARKET'),
  trader_id VARCHAR(20),
  portfolio_id VARCHAR(20),
  date DATE,
  calender_id INT,
  order_ts_imputed BOOLEAN,
  limit_price_imputed BOOLEAN,
  portfolio_id_imputed BOOLEAN,
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (trader_id) 
    REFERENCES dim_trader(trader_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (portfolio_id) 
    REFERENCES dim_portfolio(portfolio_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE fact_traders(
  trade_id VARCHAR(20) PRIMARY KEY,
  order_id VARCHAR(20),
  trade_ts TIMESTAMP,
  company_id VARCHAR(20),
  side ENUM('BUY','SELL'),
  quantity INT,
  price FLOAT,
  fees FLOAT,
  trader_id VARCHAR(20),
  portfolio_id VARCHAR(20),
  date DATE,
  calender_id INT,
  trade_is_imputed BOOLEAN,
  fees_imputed BOOLEAN,
  portfolio_id_imputed BOOLEAN,
  is_orphan_trade BOOLEAN,
  FOREIGN KEY (order_id) 
    REFERENCES fact_orders(order_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (trader_id) 
    REFERENCES dim_trader(trader_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (portfolio_id) 
    REFERENCES dim_portfolio(portfolio_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE fact_positions_snapshot(
  portfolio_id VARCHAR(20),
  company_id VARCHAR(20),
  date DATE,
  quantity INT,
  calender_id INT,
  FOREIGN KEY (portfolio_id) 
    REFERENCES dim_portfolio(portfolio_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (company_id) 
    REFERENCES dim_company(company_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (calender_id) 
    REFERENCES dim_calender(calender_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);