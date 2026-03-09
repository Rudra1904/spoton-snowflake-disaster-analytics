CREATE OR REPLACE TABLE SPOTON_ANALYTICS.STAGING.cleaned_incidents AS
SELECT
    incident_id,
    UPPER(region) AS region,
    incident_type,
    start_time,
    end_time,
    DATEDIFF('hour', start_time, end_time) AS incident_duration_hours,
    status,
    affected_stores,
    estimated_loss,
    sla_hours,
    severity,
    CASE 
        WHEN DATEDIFF('hour', start_time, end_time) > sla_hours 
        THEN 1 ELSE 0 
    END AS sla_breached,
    load_timestamp
FROM SPOTON_ANALYTICS.RAW.raw_incidents_table;