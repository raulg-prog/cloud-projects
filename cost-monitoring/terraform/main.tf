provider "aws" {
  region = "us-east-1"
}

# -------------------------
# SNS Topic
# -------------------------
resource "aws_sns_topic" "budget_alerts" {
  name = "budget-alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.budget_alerts.arn
  protocol  = "email"
  endpoint  = "your_email@gmail.com"
}

# -------------------------
# Budget
# -------------------------
resource "aws_budgets_budget" "monthly_budget" {
  name         = "raul-monthly-budget"
  budget_type  = "COST"
  limit_amount = "10"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 50
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"

    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 80
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"

    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 100
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"

    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }
}