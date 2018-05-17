resource "aws_sns_topic" "xxxx_cloudwatch_notifications" {
  name = "xxxx_cloudwatch_notifications"
}
/*
Email is unsupported - configure the subscription manually.
resource "aws_sns_topic_subscription" "xxxx_cloudwatch_notifications" {
    topic_arn = "${aws_sns_topic.xxxx_cloudwatch_notifications.arn}"
    protocol  = "email"
    endpoint  = "an.o...@gmail.com"
}
*/
resource "aws_cloudwatch_log_metric_filter" "xxxx_api_startup" {
  name = "xxxx-api-startup"
  pattern = "Starting xxxxApplication"
  log_group_name = "${aws_cloudwatch_log_group.xxxx_api_container.name}"
  metric_transformation {
    name = "xxxx-api-startup-counter"
    namespace = "LogMetrics"
    value = "1"
  }
}
resource "aws_cloudwatch_metric_alarm" "xxxx_api_startup" {
    alarm_name = "xxxx-api-startup"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "xxxx-api-startup-counter"
    namespace = "LogMetrics"
    period = "300"
    statistic = "Sum"
    threshold = "2"
    alarm_description = "This alerts if the xxxx Api container reboots twice in 10 mins"
 alarm_actions = ["${aws_sns_topic.xxxx_cloudwatch_notifications.arn}"]
    insufficient_data_actions = []
depends_on=["aws_sns_topic.xxxx_cloudwatch_notifications"]
}