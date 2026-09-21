-- Business Questions
/* Which suppliers are performing best across on-time delivery, damage rate, and freight cost? */

SELECT * FROM shipments;

SELECT
	supplier,
	ROUND(AVG(CASE WHEN on_time_flag THEN 1.00 ELSE 0.00 END) * 100, 3) AS on_time_rate,
	ROUND(AVG(damage_rate),3) AS avg_damage_rate,
	SUM(freight_cost_ngn) AS total_freight_cost
FROM shipments
GROUP BY supplier
ORDER BY avg_damage_rate DESC
LIMIT 15;


/* Which origin–destination routes experience the highest delivery delays and cost overruns? */

SELECT
	origin_state || '→' || destination_state AS route,
	COUNT(*) AS shipments,
	ROUND(AVG(delay_days),2) AS avg_delay_days,
	ROUND(AVG(cost_variance_ngn),2) AS avg_cost_overrun,
	SUM(cost_variance_ngn) AS total_cost_overrun
FROM shipments
GROUP BY origin_state, destination_state
ORDER BY avg_delay_days DESC, total_cost_overrun DESC
LIMIT 10;


/* What factors are most associated with late deliveries, particularly distance, priority, supplier, and material?*/
SELECT
	material_category,
	COUNT(*) AS shipments,
	ROUND(AVG(CASE WHEN on_time_flag THEN 0.0 ELSE 1.0 END)*100,2) AS late_delivery_rate,
	ROUND(AVG(delay_days), 2) AS avg_delay_days

FROM shipments
GROUP BY material_category
ORDER BY late_delivery_rate DESC;



/* Which renewable-energy materials have the highest damage rates and shipment losses? */
SELECT
	material_category,
	COUNT(*) AS shipments,
	SUM(units_shipped) AS units_shipped,
	SUM(units_damaged) AS units_damaged,
	ROUND(SUM(units_damaged)::numeric / NULLIF(SUM(units_shipped), 0) *100, 2) AS damage_rate_pct,
	SUM(units_shipped - units_received) AS shipment_losses
	FROM shipments
	GROUP BY material_category
	ORDER BY damage_rate_pct DESC
	LIMIT 10;


/* Which suppliers and routes consistently exceed their budgeted freight costs? */
SELECT
    supplier,
    COUNT(*) AS shipments,
    COUNT(*) FILTER (WHERE cost_variance_ngn > 0) AS over_budget_shipments,
    ROUND(
        COUNT(*) FILTER (WHERE cost_variance_ngn > 0)::numeric
        / COUNT(*) * 100,
        2
    ) AS over_budget_rate_pct,
    ROUND(AVG(cost_variance_ngn), 2) AS avg_cost_variance_ngn,
    SUM(cost_variance_ngn) AS total_cost_variance_ngn
FROM shipments
GROUP BY supplier
HAVING COUNT(*) FILTER (WHERE cost_variance_ngn > 0) > 0
ORDER BY over_budget_rate_pct DESC, total_cost_variance_ngn DESC;


/*Does longer transportation distance lead to higher freight costs, longer transit times, or greater material damage? */
SELECT
    distance_km,
    freight_cost_ngn
FROM shipments
WHERE distance_km IS NOT NULL
  AND freight_cost_ngn IS NOT NULL
ORDER BY distance_km;



/*Which suppliers, routes, and materials should management prioritize for corrective action to improve delivery reliability and reduce logistics costs? */

-- 1. Suppliers to prioritize
SELECT
    supplier,
    COUNT(*) AS shipments,
    ROUND(
        AVG(CASE WHEN on_time_flag THEN 0.0 ELSE 1.0 END) * 100,
        2
    ) AS late_delivery_rate_pct,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(
        COUNT(*) FILTER (WHERE cost_variance_ngn > 0)::numeric
        / COUNT(*) * 100,
        2
    ) AS over_budget_rate_pct,
    SUM(cost_variance_ngn) AS total_cost_variance_ngn
FROM shipments
GROUP BY supplier
HAVING COUNT(*) >= 5
ORDER BY
    late_delivery_rate_pct DESC,
    total_cost_variance_ngn DESC;


-- 2.  Routes to Prioritise

SELECT
    origin_state || ' → ' || destination_state AS route,
    COUNT(*) AS shipments,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(
        AVG(CASE WHEN on_time_flag THEN 0.0 ELSE 1.0 END) * 100,
        2
    ) AS late_delivery_rate_pct,
    ROUND(AVG(cost_variance_ngn), 2) AS avg_cost_variance_ngn,
    SUM(cost_variance_ngn) AS total_cost_variance_ngn
FROM shipments
GROUP BY origin_state, destination_state
HAVING COUNT(*) >= 5
ORDER BY
    late_delivery_rate_pct DESC,
    total_cost_variance_ngn DESC;


-- 3. Materials to Prioritise

SELECT
    material_category,
    COUNT(*) AS shipments,
    ROUND(AVG(delay_days), 2) AS avg_delay_days,
    ROUND(
        AVG(CASE WHEN on_time_flag THEN 0.0 ELSE 1.0 END) * 100,
        2
    ) AS late_delivery_rate_pct,
    ROUND(
        SUM(units_damaged)::numeric
        / NULLIF(SUM(units_shipped), 0) * 100,
        2
    ) AS damage_rate_pct,
    SUM(units_damaged) AS units_damaged,
    SUM(cost_variance_ngn) AS total_cost_variance_ngn
FROM shipments
GROUP BY material_category
HAVING COUNT(*) >= 5
ORDER BY
    late_delivery_rate_pct DESC,
    damage_rate_pct DESC,
    total_cost_variance_ngn DESC;



-- Corrective Action Flag

WITH supplier_analysis AS (
    SELECT
        supplier,
        COUNT(*) AS shipments,
        ROUND(
            AVG(CASE WHEN on_time_flag THEN 0.0 ELSE 1.0 END) * 100,
            2
        ) AS late_delivery_rate_pct,
        ROUND(AVG(delay_days), 2) AS avg_delay_days,
        ROUND(
            COUNT(*) FILTER (WHERE cost_variance_ngn > 0)::numeric
            / COUNT(*) * 100,
            2
        ) AS over_budget_rate_pct,
        SUM(cost_variance_ngn) AS total_cost_variance_ngn
    FROM shipments
    GROUP BY supplier
)

SELECT
    supplier,
    shipments,
    late_delivery_rate_pct,
    avg_delay_days,
    over_budget_rate_pct,
    total_cost_variance_ngn,
    CASE
        WHEN late_delivery_rate_pct >= 30
             AND over_budget_rate_pct >= 50
            THEN 'High Priority'
        WHEN late_delivery_rate_pct >= 20
             OR over_budget_rate_pct >= 40
            THEN 'Medium Priority'
        ELSE 'Monitor'
    END AS corrective_action
FROM supplier_analysis
ORDER BY
    CASE
        WHEN late_delivery_rate_pct >= 30
             AND over_budget_rate_pct >= 50 THEN 1
        WHEN late_delivery_rate_pct >= 20
             OR over_budget_rate_pct >= 40 THEN 2
        ELSE 3
    END,
    late_delivery_rate_pct DESC;