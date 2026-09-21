# Renewable Energy Supply Chain & Logistics Performance

![Excel](https://img.shields.io/badge/Tools-Microsoft%20Excel-green?style=flat&logo=microsoft-excel)
![Status](https://img.shields.io/badge/Project-Completed-blue)
![Domain](https://img.shields.io/badge/Domain-Logistics%20%26%20Supply%20Chain-orange)

<img width="1575" height="766" alt="Renewable Energy Dashboard" src="https://github.com/user-attachments/assets/083c6f39-e3ec-4b98-bdc2-0ce5a9f55a6f" />


An end-to-end data analysis project investigating delivery delays, material damage, supplier performance, and freight cost overruns across 300 renewable-energy shipment records (Jan – Sept 2026).

 **Core Problem:** Identify specific operational bottlenecks driving shipment delays, material damage, and freight cost variances in last-mile renewable energy deployment.


# Dataset Overview & Dictionary

## Dataset Scope

- **Total Records:** 300 shipment records
- **Coverage Period:** January 10 – September 6, 2026
- **Geographical Scope:** Nigeria
- **Number of Fields:** 25
- **Dataset Type:** Simulated operational dataset
- **Primary Focus:** Renewable energy logistics and supply chain performance

# Key Performance Indicators (KPIs) & Schema

| Metric | Calculation / Operational Logic | Core Target |
|---|---|---:|
| **Delay Days** | `Actual Transit Days − Planned Transit Days` | Minimize to 0 |
| **Damage Rate (%)** | `(Units Damaged / Units Shipped) × 100` | `< 1.5%` |
| **Cost Variance (₦)** | `Actual Freight Cost − Budgeted Freight Cost` | `≤ ₦0` |
| **On-Time Delivery %** | `(On-Time Shipments / Total Shipments) × 100` | Maximized |
| **Supplier Score** | Composite measure combining delivery, damage, and cost rates | `> 95.00` |


# Business Questions

The analysis was designed to answer the following operational questions:

1. Which routes experience the highest delivery delays?
2. Does transportation distance affect transit time and freight cost?
3. Does distance alone explain material damage?
4. Which origin-to-destination corridors have the highest delay concentration?
5. Which routes have the largest freight cost overruns?
6. Which material categories experience the highest damage rates?
7. Which suppliers have the strongest overall performance?
8. How significant are the differences between suppliers?
9. Are logistics outcomes influenced more by supplier performance or route/carrier performance?
10. Which operational areas should be prioritized for corrective action?

### Key Performance Targets (90-Day Plan)
*  **15% Reduction** in average delivery delay days.
*  **10% Reduction** in material damage rates.
*  **10% Reduction** in route-level cost variances.

# Key Insights

## 1. Distance vs. Risk Dynamics

Longer distances drive higher transit times and freight costs, but distance alone does not explain material damage.

Damage is driven more by route conditions and handling practices rather than mileage.



## 2. High Delay Concentration

Delivery delays are heavily clustered on specific origin-to-destination corridors:

- **Rivers → Niger**
- **Oyo → Anambra**
- **Edo → Kwara**

These patterns indicate localized route bottlenecks rather than systemic failures across the entire logistics network.



## 3. Cost Overrun Clusters

Freight cost overruns are non-uniform across the network.

**Delta → Rivers** accounts for the highest average cost variance at approximately **₦182.4K**, signaling the need for contract and price structure reviews.

**Rivers → Kaduna** also recorded a significant average cost variance of approximately **₦155.4K**.



## 4. Sensitive Component Damage

Smaller, high-precision equipment experiences higher damage rates compared with structural hardware.

| Material Category | Damage Rate |
|---|---:|
| Monitoring Equipment | **2.23%** |
| Cables & Protection | **2.10%** |
| Hybrid Inverters | **2.07%** |
| Mounting Structures | **1.56%** |

This indicates that sensitive equipment may require additional packaging, handling, and transportation controls.



## 5. Supplier Parity

Supplier performance scores remain relatively tightly clustered:

| Supplier | Performance Score |
|---|---:|
| SunCore Energy | **94.45** |
| GreenVolt Nigeria | **93.75** |
| EcoPower Logistics | **93.26** |
| PowerGrid Solutions | **92.43** |
| SolarTech Supplies | **91.92** |

The relatively narrow range suggests that route and carrier performance can materially influence logistics outcomes in addition to supplier selection.



## Detailed Recommendations

### Short-Term Action Plan (Immediate: 0–30 Days)

#### 1. Target High-Delay Routes

Intervene directly on the following high-delay corridors:

- **Rivers → Niger**
- **Oyo → Anambra**
- **Edo → Kwara**

Recommended actions:

- Audit carrier schedules and reliability.
- Review road conditions along the affected corridors.
- Analyze transit handoffs between logistics partners.
- Investigate dispatch and loading delays.
- Establish route-specific transit benchmarks.
- Monitor performance against the established benchmarks.

The immediate objective is to address the approximately **7-day average delay** observed on the high-risk corridors.

---

#### 2. Audit High-Variance Freight Pricing

Investigate contract terms, carrier pricing, and unexpected accessorial fees on the following routes:

| Route | Average Cost Overrun |
|---|---:|
| **Delta → Rivers** | **₦182.4K** |
| **Rivers → Kaduna** | **₦155.4K** |

Recommended actions:

- Review existing carrier contracts.
- Identify unexpected accessorial charges.
- Compare actual freight rates against agreed rates.
- Review route-specific surcharges.
- Investigate fuel and loading/unloading charges.
- Establish route-level cost benchmarks and variance thresholds.

The objective is to identify the sources of recurring cost overruns and improve freight cost control.


#### 3. Upgrade Packaging for Sensitive Cargo

Prioritize packaging and handling improvements for material categories with the highest observed damage rates:

| Material Category | Damage Rate |
|---|---:|
| **Monitoring Equipment** | **2.23%** |
| **Cables & Protection** | **2.10%** |
| **Hybrid Inverters** | **2.07%** |

Recommended actions:

- Introduce shock-absorbent packaging.
- Use drop indicators for sensitive equipment.
- Improve loading and unloading controls.
- Introduce standardized handling procedures.
- Conduct pre-dispatch packaging inspections.
- Provide clear handling instructions for sensitive components.

The objective is to reduce avoidable damage during transportation and handling.



### Medium to Long-Term Plan (Strategic: 1–6 Months)

#### 1. Route Benchmarking & Monthly Audits

Establish baseline performance benchmarks for each major route corridor.

Track:

- Average transit time
- Average delay days
- On-Time Delivery %
- Freight cost
- Cost variance
- Damage rate

Transport partner performance should be reviewed monthly against agreed route-level benchmarks.


#### 2. Supplier & Carrier Scorecards

Implement monthly supplier and carrier scorecards covering:

| Performance Metric | Purpose |
|---|---|
| **On-Time Delivery %** | Measures delivery reliability |
| **Damage Rate %** | Measures material handling performance |
| **Cost Variance %** | Measures freight cost efficiency |
| **Overall Performance Score** | Provides a consolidated performance view |

The scorecards should be used to identify recurring performance issues and support evidence-based supplier and carrier reviews.



#### 3. Centralized Dashboard Deployment

Deploy an interactive **Excel/Power BI dashboard** accessible across:

- Procurement
- Operations
- Finance
- Logistics
- Project Teams

The dashboard should provide centralized visibility into:

- Shipment performance
- Route performance
- Supplier performance
- Delivery delays
- Material damage
- Freight costs
- Cost variance
- On-Time Delivery %

Interactive filters and slicers should allow teams to drill down by supplier, route, material category, project, priority, and delivery status.


#### 4. 90-Day Targeted Improvement Program

Establish the **September 2026 baseline** and track performance over a 90-day improvement period.

### Target Improvements

| KPI | 90-Day Target |
|---|---:|
| **Average Delay Days** | Reduce by **15%** |
| **Damage Rate** | Reduce by **10%** |
| **Route-Level Cost Variance** | Reduce by **10%** |

Performance should be reviewed monthly to determine whether the improvement initiatives are delivering measurable results.

### 90-Day Monitoring Framework

```text
September 2026 Baseline
          ↓
       Month 1
          ↓
Performance Review
          ↓
       Month 2
          ↓
Performance Review
          ↓
       Month 3
          ↓
Final 90-Day Assessment







