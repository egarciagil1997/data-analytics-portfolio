-- Project 01 - Advanced Incident Analysis
-- Synthetic incident/log scenario for portfolio demonstration.
-- Scenario: database outage followed by a burst of 10,000 queued requests.

-- 1. Create synthetic request log table
CREATE TABLE IF NOT EXISTS incident_logs (
    request_id INTEGER,
    request_time TEXT,
    status_code INTEGER,
    response_time_ms INTEGER,
    query_type TEXT,
    retry_count INTEGER
);

-- 2. Example analysis queries

-- Requests by status
SELECT status_code, COUNT(*) AS total_requests
FROM incident_logs
GROUP BY status_code
ORDER BY total_requests DESC;

-- Average response time by query type
SELECT
    query_type,
    COUNT(*) AS total_requests,
    ROUND(AVG(response_time_ms), 2) AS avg_response_time_ms
FROM incident_logs
GROUP BY query_type
ORDER BY avg_response_time_ms DESC;

-- Slow requests
SELECT
    query_type,
    COUNT(*) AS slow_requests
FROM incident_logs
WHERE response_time_ms >= 2000
GROUP BY query_type
ORDER BY slow_requests DESC;

-- Error rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN status_code >= 500 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS error_rate_percentage
FROM incident_logs;

-- Requests with retries
SELECT
    retry_count,
    COUNT(*) AS total_requests
FROM incident_logs
GROUP BY retry_count
ORDER BY retry_count;

-- Analyst recommendations:
-- * Introduce bounded queues and backpressure.
-- * Apply rate limiting during recovery.
-- * Use connection pooling with safe limits.
-- * Limit retries and use exponential backoff.
-- * Add circuit breakers for failing dependencies.
-- * Optimize slow queries and review indexes.
