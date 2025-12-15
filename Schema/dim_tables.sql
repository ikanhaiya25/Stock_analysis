CREATE TABLE dim_exchange(
  exchange_id VARCHAR(20) PRIMARY KEY,
  exchange_name VARCHAR(100),
  country VARCHAR(50),
  currency VARCHAR(20)
);

CREATE TABLE dim_sector(
  sector_id VARCHAR(20) PRIMARY KEY,
  sector_name VARCHAR(100)
);

CREATE TABLE dim_company(
  company_id VARCHAR(20) PRIMARY KEY,
  ticker VARCHAR(10),
  company_name VARCHAR(200),
  sector_id VARCHAR(20),
  exchange_id VARCHAR(20),
  FOREIGN KEY (sector_id) 
    REFERENCES dim_sector(sector_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (exchange_id) 
    REFERENCES dim_exchange(exchange_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE dim_trader(
  trader_id VARCHAR(20) PRIMARY KEY,
  trader_name VARCHAR(50),
  desk VARCHAR(20)
);

CREATE TABLE dim_portfolio(
  portfolio_id VARCHAR(20) PRIMARY KEY,
  portfolio_name VARCHAR(20),
  manager VARCHAR(20)
);

CREATE TABLE dim_calender (
  date DATE,
  calender_id INT PRIMARY KEY,
  year INT,
  month INT,
  day INT,
  is_month_start BOOLEAN
);