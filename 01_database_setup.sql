CREATE TABLE support_tickets (
    ticket_id INT PRIMARY KEY,
    client_id INT,
    issue_type VARCHAR(100),
    description TEXT,
    created_at DATE,
    resolved_at DATE,
    status VARCHAR(50)
);

INSERT INTO support_tickets (ticket_id, client_id, issue_type, description, created_at, resolved_at, status) VALUES
(1, 1, 'Technical', 'Internet connectivity issue', '2024-12-15', '2024-12-17', 'Resolved'),
(2, 2, 'Billing', 'Incorrect invoice amount', '2025-01-05', NULL, 'Open'),
(3, 3, 'Technical', 'VoIP not working', '2025-02-01', '2025-02-02', 'Resolved'),
(4, 4, 'General Inquiry', 'Need information about upgrade', '2025-02-10', NULL, 'Pending');
