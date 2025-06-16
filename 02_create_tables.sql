
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100),
    industry VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    service_type VARCHAR(50),
    monthly_fee DECIMAL(10,2)
);

CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    service_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE usage_data (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    usage_date DATE,
    data_used_gb DECIMAL(10,2),
    call_minutes INT,
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

CREATE TABLE support_tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    issue_type VARCHAR(100),
    resolution_time_hours DECIMAL(10,2),
    resolved BOOLEAN,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE churn_data (
    churn_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    churn_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE financials (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    year INT,
    revenue DECIMAL(15,2),
    cost DECIMAL(15,2),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE support_efficiency (
    support_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    efficiency_score DECIMAL(5,2),
    FOREIGN KEY (ticket_id) REFERENCES support_tickets(ticket_id)
);

CREATE TABLE user_segments (
    segment_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    segment_name VARCHAR(100),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);