SELECT 
    'Dividends' as action_type,
    c.ticker,
    c.company_name,
    COUNT(*) as event_count,
    SUM(d.divident_per_share) as total_dividend_per_share,
    NULL as split_info
FROM fact_divdends d
JOIN dim_company c ON d.company_id = c.company_id
GROUP BY c.ticker, c.company_name

UNION ALL

SELECT 
    'Splits' as action_type,
    c.ticker,
    c.company_name,
    COUNT(*) as event_count,
    NULL as total_dividend_per_share,
    GROUP_CONCAT(CONCAT(s.split_ratio, ':1') SEPARATOR ', ') as split_info
FROM fact_splits s
JOIN dim_company c ON s.company_id = c.company_id
GROUP BY c.ticker, c.company_name

ORDER BY ticker, action_type;