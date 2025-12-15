SELECT 
    c.ticker,
    c.company_name,
    COUNT(*) as trading_days,
    MIN(p.low) as period_low,
    MAX(p.high) as period_high,
    AVG(p.adjusted_close) as avg_close,
    ROUND((MAX(p.high) - MIN(p.low)) * 100.0 / MIN(p.low), 2) as volatility_pct,
    AVG(p.volume) as avg_daily_volume,
    SUM(CASE WHEN p.is_volume_support = TRUE THEN 1 ELSE 0 END) as low_volume_days
FROM fact_daily_prices p
JOIN dim_company c ON p.company_id = c.company_id
GROUP BY c.ticker, c.company_name
ORDER BY volatility_pct DESC
LIMIT 15;