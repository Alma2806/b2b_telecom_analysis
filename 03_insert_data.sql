INSERT INTO clients (client_name, industry, region) VALUES
  ('Telecom GmbH', 'Telecom', 'Germany'),
  ('Orange FR', 'Telecom', 'France'),
  ('Telefonica ES', 'Telecom', 'Spain');

INSERT INTO services (service_name, service_type, monthly_fee) VALUES
  ('5G Internet', 'Mobile', 49.99),
  ('Fiber Optic', 'Internet', 59.99),
  ('Business Plan', 'Mobile', 79.99);

INSERT INTO subscriptions (client_id, service_id, start_date, end_date) VALUES
  (1, 1, '2023-01-01', NULL),
  (2, 2, '2023-02-15', NULL),
  (3, 3, '2023-03-10', NULL);

INSERT INTO usage_data (subscription_id, usage_date, data_used_gb, call_minutes) VALUES
  (1, '2023-05-01', 12.5, 200),
  (2, '2023-05-02', 8.0, 150),
  (3, '2023-05-03', 15.3, 220);

INSERT INTO support_tickets (client_id, issue_type, resolution_time_hours, resolved) VALUES
  (1, 'Connectivity', 5.5, TRUE),
  (2, 'Billing', 2.0, TRUE),
  (3, 'Service Upgrade', 3.2, TRUE);

INSERT INTO support_efficiency (ticket_id, efficiency_score) VALUES
  (1, 88.5),
  (2, 92.0),
  (3, 79.5);

INSERT INTO churn_data (client_id, churn_date, reason) VALUES
  (2, '2024-01-01', 'High cost'),
  (3, '2024-03-15', 'Service issues');

INSERT INTO financials (client_id, year, revenue, cost) VALUES
  (1, 2023, 100000.00, 75000.00),
  (2, 2023, 120000.00, 80000.00),
  (3, 2023, 95000.00, 70000.00);

INSERT INTO user_segments (client_id, segment_name) VALUES
  (1, 'Large Enterprise'),
  (2, 'Mid-Market'),
  (3, 'SMB');

INSERT INTO clients (client_name, industry, region)
VALUES ('Example Client', 'Telecom', 'Germany');

INSERT INTO support_tickets (client_id, issue_type, resolution_time_hours, resolved, date_reported)
VALUES (1, 'Network Issue', 3.5, TRUE, '2025-06-17');  -- Make sure client_id=1 exists in clients table