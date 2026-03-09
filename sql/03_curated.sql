CREATE OR REPLACE TABLE SPOTON_ANALYTICS.CURATED.fact_incidents AS
SELECT
    incident_id,
    region,
    DATE(start_time) AS incident_date,
    incident_type,
    incident_duration_hours,
    affected_stores,
    estimated_loss,
    sla_breached,
    severity,
    load_timestamp
FROM SPOTON_ANALYTICS.STAGING.cleaned_incidents;