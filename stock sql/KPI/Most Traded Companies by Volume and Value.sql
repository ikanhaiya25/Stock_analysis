SELECT 
    c.company_id,
    c.ticker,
    c.company_name,
    s.sector_name,
    COUNT(*) as trade_count,
    SUM(t.quantity) as total_volume,
    SUM(t.quantity * t.price) as total_value,
    AVG(t.price) as avg_trade_price,
    SUM(t.fees) as fees_generated
FROM fact_traders t
JOIN dim_company c ON t.company_id = c.company_id
JOIN dim_sector s ON c.sector_id = s.sector_id
GROUP BY c.company_id, c.ticker, c.company_name, s.sector_name
ORDER BY total_value DESC
LIMIT 15;