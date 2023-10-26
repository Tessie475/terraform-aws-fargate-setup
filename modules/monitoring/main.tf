# Monitoring using CloudWatch Alarms for high 4xx 
resource "aws_cloudwatch_metric_alarm" "high_4xx_errors" {
  alarm_name          = "High4xxErrors"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "HTTPCode_Target_4XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "300"
  statistic           = "Sum"
  threshold           = "50"
  alarm_description   = "This metric checks if there are more than 50 4xx errors in 5 minutes"

  dimensions = {
    LoadBalancer = var.load_balancer_arn
  }

  actions_enabled = true
  alarm_actions   = var.topic_arn
}

# resource "aws_cloudwatch_metric_alarm" "high_5xx_errors" {
# .
# }
