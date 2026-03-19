
# AWS Cost Monitoring & Alerting System

## 📌 Overview

This project implements a cloud cost monitoring and alerting system in AWS to track usage, prevent overspending, and improve cost visibility. It demonstrates real-world FinOps practices using AWS-native tools and tagged infrastructure.

---

## ❗ Problem

Cloud costs can quickly grow without proper monitoring and alerts. Without visibility, it becomes difficult to identify which resources are generating costs and when spending exceeds expectations.

---

## 💡 Solution

This project uses AWS Cost Explorer, AWS Budgets, and SNS notifications to:

* Monitor cloud spending
* Set budget thresholds
* Trigger alerts when limits are exceeded
* Track cost per project using resource tags

---

## 🏗️ Architecture

* **EC2** → generates usage/cost
* **AWS Budgets** → defines spending limits
* **SNS** → sends alert notifications
* **Cost Explorer** → analyzes cost data
* **Tags** → enables cost tracking per project

---

## ⚙️ Implementation Steps

### 1. Enable Cost Explorer

* Activated AWS Cost Explorer via Billing Dashboard
* Note: Data takes up to 24 hours to populate

📸 *Add screenshot here*

---

### 2. Create Budget

* Monthly budget: **$10**
* Alerts configured:

  * 50% (Actual)
  * 80% (Actual)
  * 100% (Forecasted)

📸 *Add screenshot here*

---

### 3. Configure SNS Alerts

* Created SNS topic: `budget-alerts`
* Subscribed email endpoint for notifications
* Confirmed email subscription

📸 *Add screenshot here*

---

### 4. Connect Budget to SNS

* Linked SNS topic ARN to all budget alerts
* Enabled automated notifications via SNS

📸 *Add screenshot here*

---

### 5. Deploy Cost-Generating Resource

* Launched EC2 instance:

  * Name: `cost-monitor`
  * Type: `t3.micro`

📸 *Add screenshot here*

---

### 6. Tag Resources for Cost Tracking

* Tag key: `Project`
* Tag value: `CostMonitoringLab`

📸 *Add screenshot here*

---

### 7. Analyze Cost Data

* Used Cost Explorer to:

  * View service-level spending
  * Group costs by tag (`Project`)

📸 *Add screenshot here*

---

## 🧠 Key Concepts Demonstrated

* Cost monitoring and budgeting (FinOps fundamentals)
* AWS resource tagging strategy
* Event-driven alerting using SNS
* Cloud cost visibility and analysis

---

## ⚠️ Challenges & Learnings

* Cost Explorer data is delayed (~24 hours)
* SNS email subscriptions require manual confirmation
* Cost Explorer cannot be provisioned via Terraform
* Budget thresholds must be tuned to avoid alert fatigue

---

## 🚀 Future Improvements

* Implement full infrastructure using **Terraform**
* Add tag-based budgets for per-project cost tracking
* Integrate with **Grafana dashboards**
* Automate cost control actions using **AWS Lambda**

---

## 🧾 Terraform (Planned)

This project will be extended to include Infrastructure as Code using Terraform:

```hcl
# Example (placeholder)
resource "aws_sns_topic" "budget_alerts" {
  name = "budget-alerts"
}
```

---

## 📁 Project Structure

```
cost-monitoring/
│
├── README.md
├── terraform/
├── screenshots/
```

---

## 📊 Outcome

This project demonstrates how to design a cost-aware cloud environment with proactive alerting and resource-level visibility, aligning with real-world cloud engineering and FinOps practices.
