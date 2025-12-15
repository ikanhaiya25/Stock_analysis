SELECT 
    s.sector_name,
    COUNT(DISTINCT t.company_id) as companies_traded,
    COUNT(*) as total_trades,
    SUM(t.quantity) as total_volume,
    SUM(t.quantity * t.price) as total_trade_value,
    AVG(t.quantity * t.price) as avg_trade_size,
    SUM(t.fees) as total_fees,
    ROUND(SUM(t.quantity * t.price) * 100.0 / 
        (SELECT SUM(quantity * price) FROM fact_traders), 2) as pct_of_total_value
FROM fact_traders t
JOIN dim_company c ON t.company_id = c.company_id
JOIN dim_sector s ON c.sector_id = s.sector_id
GROUP BY s.sector_name
ORDER BY total_trade_value DESC;