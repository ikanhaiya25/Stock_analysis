SELECT 
    cal.year,
    cal.month,
    COUNT(*) as total_trades,
    SUM(t.quantity) as total_volume,
    SUM(t.quantity * t.price) as total_trade_value,
    SUM(t.fees) as total_fees,
    AVG(t.quantity * t.price) as avg_trade_value,
    COUNT(DISTINCT t.trader_id) as active_traders,
    COUNT(DISTINCT t.company_id) as companies_traded
FROM fact_traders t
JOIN dim_calender cal ON t.calender_id = cal.calender_id
GROUP BY cal.year, cal.month
ORDER BY cal.year, cal.month;