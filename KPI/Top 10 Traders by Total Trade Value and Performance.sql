SELECT 
    t.trader_id,
    dt.trader_name,
    dt.desk,
    COUNT(*) as total_trades,
    SUM(t.quantity * t.price) as total_trade_value,
    SUM(t.fees) as total_fees_generated,
    AVG(t.quantity * t.price) as avg_trade_value,
    SUM(CASE WHEN t.side = 'BUY' THEN 1 ELSE 0 END) as buy_trades,
    SUM(CASE WHEN t.side = 'SELL' THEN 1 ELSE 0 END) as sell_trades
FROM fact_traders t
JOIN dim_trader dt ON t.trader_id = dt.trader_id
GROUP BY t.trader_id, dt.trader_name, dt.desk
ORDER BY total_trade_value DESC
LIMIT 10;