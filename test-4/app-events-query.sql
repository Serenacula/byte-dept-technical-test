-- Couldn't get these variables to work, postgres didn't like the 'date' type for some reason
-- DECLARE month_start date DEFAULT to_date('2022-10', 'YYYY-MM');
-- DECLARE month_end date DEFAULT month_start + INTERVAL '1 month';

SELECT 
    COUNT(*) 
		filter (WHERE event_data ->> 'StateName' = 'reorder-allergy-info') AS reorder_allergy_info_count,
	COUNT(*) 
		filter (WHERE event_data ->> 'StateName' = 'reorder') AS reorder_count,
	COUNT(*) 
		filter (WHERE event_data ->> 'StateName' = 'reorder-pay') AS reorder_pay_count
FROM app_events
WHERE event_type = 'VisitState'
    AND bot_id = 'gerald'
    AND (created_at BETWEEN to_date('2022-10', 'YYYY-MM') AND to_date('2022-10', 'YYYY-MM') + INTERVAL '1 month');