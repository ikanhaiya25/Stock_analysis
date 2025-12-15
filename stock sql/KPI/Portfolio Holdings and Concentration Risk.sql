SELECT 
    p.portfolio_id,
    dp.portfolio_name,
    dp.manager,
    COUNT(DISTINCT p.company_id) as num_positions,
    SUM(p.quantity) as total_shares,
    MAX(p.quantity) as largest_position,
    ROUND(MAX(p.quantity) * 100.0 / SUM(p.quantity), 2) as concentration_pct
FROM fact_positions_snapshot p
JOIN dim_portfolio dp ON p.portfolio_id = dp.portfolio_id
GROUP BY p.portfolio_id, dp.portfolio_name, dp.manager
ORDER BY total_shares DESC;