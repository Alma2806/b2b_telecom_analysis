SELECT s.service_name, COUNT(*) AS total_subscriptions
FROM subscriptions sub
JOIN services s ON sub.service_id = s.service_id
GROUP BY s.service_name
ORDER BY total_subscriptions DESC;

SELECT client_id, COUNT(*) AS service_count
FROM subscriptions
GROUP BY client_id
HAVING service_count > 1;

SELECT c.client_name, SUM(ud.data_used_gb) AS total_data_usage
FROM clients c
JOIN subscriptions s ON c.client_id = s.client_id
JOIN usage_data ud ON s.subscription_id = ud.subscription_id
GROUP BY c.client_name
ORDER BY total_data_usage DESC
LIMIT 5;

SELECT issue_type, AVG(resolution_time_hours) AS avg_resolution_time
FROM support_tickets
GROUP BY issue_type
ORDER BY avg_resolution_time DESC;

SELECT reason, COUNT(*) AS total_churns
FROM churn_data
GROUP BY reason
ORDER BY total_churns DESC;

SELECT c.client_name, 
       SUM(f.revenue) AS total_revenue,
       SUM(f.cost) AS total_cost,
       SUM(f.revenue - f.cost) AS profit
FROM clients c
JOIN financials f ON c.client_id = f.client_id
GROUP BY c.client_name
ORDER BY profit DESC;

SELECT st.ticket_id, se.efficiency_score
FROM support_tickets st
JOIN support_efficiency se ON st.ticket_id = se.ticket_id
ORDER BY se.efficiency_score DESC;

SELECT segment_name, COUNT(*) AS number_of_clients
FROM user_segments
GROUP BY segment_name
ORDER BY number_of_clients DESC;

SELECT sv.service_name, COUNT(*) AS number_of_subscriptions
FROM services sv
JOIN subscriptions s ON sv.service_id = s.service_id
GROUP BY sv.service_name
ORDER BY number_of_subscriptions DESC;

SELECT service_type, AVG(monthly_fee) AS avg_fee
FROM services
GROUP BY service_type
ORDER BY avg_fee DESC;

WITH churn_counts AS (
    SELECT 
        us.segment_name,
        s.service_type,
        COUNT(*) AS total_users,
        COUNT(CASE WHEN c.churn_date IS NOT NULL THEN 1 END) AS churned_users
    FROM churn_data c
    JOIN user_segments us ON c.client_id = us.client_id
    JOIN subscriptions sb ON c.client_id = sb.client_id
    JOIN services s ON sb.service_id = s.service_id
    GROUP BY us.segment_name, s.service_type
)
SELECT 
    segment_name,
    service_type,
    churned_users,
    total_users,
    ROUND(100 * churned_users / total_users, 2) AS churn_rate_percentage
FROM churn_counts
ORDER BY churn_rate_percentage DESC;

SELECT 
    us.segment_name,
    ROUND(AVG(ud.data_used_gb), 2) AS avg_data_usage_gb
FROM user_segments us
JOIN subscriptions s ON us.client_id = s.client_id
JOIN usage_data ud ON s.subscription_id = ud.subscription_id
GROUP BY us.segment_name
ORDER BY avg_data_usage_gb DESC;

SELECT 
    c.client_name,
    SUM(f.revenue - f.cost) AS net_profit
FROM clients c
JOIN financials f ON c.client_id = f.client_id
GROUP BY c.client_name
ORDER BY net_profit ASC
LIMIT 5;

SELECT 
    st.issue_type,
    us.segment_name,
    ROUND(AVG(st.resolution_time_hours), 2) AS avg_resolution_time
FROM support_tickets st
JOIN user_segments us ON st.client_id = us.client_id
GROUP BY st.issue_type, us.segment_name
ORDER BY avg_resolution_time DESC;

SELECT 
    DATE_FORMAT(st.date_reported, '%Y-%m') AS month,
    st.issue_type,
    COUNT(*) AS total_issues
FROM support_tickets st
GROUP BY month, st.issue_type
ORDER BY month DESC, total_issues DESC;

SELECT 
    c.client_name
FROM clients c
LEFT JOIN support_tickets st ON c.client_id = st.client_id
WHERE st.ticket_id IS NULL;

SELECT 
    s.service_name,
    COUNT(*) AS churned_count
FROM churn_data c
JOIN subscriptions sb ON c.client_id = sb.client_id
JOIN services s ON sb.service_id = s.service_id
GROUP BY s.service_name
ORDER BY churned_count DESC;







