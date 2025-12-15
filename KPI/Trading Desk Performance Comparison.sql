SELECT 
    dt.desk,
    COUNT(DISTINCT t.trader_id) as num_traders,
    COUNT(*) as total_trades,
    SUM(t.quantity * t.price) as total_trade_value,
    SUM(t.fees) as total_fees,
    AVG(t.quantity * t.price) as avg_trade_value,
    SUM(t.quantity * t.price) / COUNT(DISTINCT t.trader_id) as value_per_trader
FROM fact_traders t
JOIN dim_trader dt ON t.trader_id = dt.trader_id
GROUP BY dt.desk
ORDER BY total_trade_value DESC;