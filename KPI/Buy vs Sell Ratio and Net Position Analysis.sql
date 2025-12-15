SELECT 
    c.ticker,
    c.company_name,
    SUM(CASE WHEN t.side = 'BUY' THEN t.quantity ELSE 0 END) as total_bought,
    SUM(CASE WHEN t.side = 'SELL' THEN t.quantity ELSE 0 END) as total_sold,
    SUM(CASE WHEN t.side = 'BUY' THEN t.quantity ELSE -t.quantity END) as net_position,
    COUNT(CASE WHEN t.side = 'BUY' THEN 1 END) as buy_trades,
    COUNT(CASE WHEN t.side = 'SELL' THEN 1 END) as sell_trades,
    ROUND(COUNT(CASE WHEN t.side = 'BUY' THEN 1 END) * 100.0 / COUNT(*), 2) as buy_percentage
FROM fact_traders t
JOIN dim_company c ON t.company_id = c.company_id
GROUP BY c.ticker, c.company_name
HAVING COUNT(*) >= 5
ORDER BY ABS(SUM(CASE WHEN t.side = 'BUY' THEN t.quantity ELSE -t.quantity END)) DESC
LIMIT 10;