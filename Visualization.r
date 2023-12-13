# Libraries required
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
  library(ggplot2)
} else {
  library(ggplot2)
}

# Sample data: replace this with your actual sleep and wake-up times
sleep_data <- data.frame(
  day = c(1, 2, 3, 4, 5),  # Days
  sleep_time = c("22:00", "23:30", "23:15", "22:45", "23:00"),  # Sleep times
  wakeup_time = c("7:00", "8:30", "8:15", "7:45", "8:00")  # Wake-up times
)

# Convert sleep and wake-up times to POSIXct format
sleep_data$sleep_time <- as.POSIXct(sleep_data$sleep_time, format = "%H:%M")
sleep_data$wakeup_time <- as.POSIXct(sleep_data$wakeup_time, format = "%H:%M")

# Create a ggplot with sleep and wake-up times connected by an abline
ggplot(sleep_data, aes(x = sleep_time, y = day)) +
  geom_point(aes(color = "Sleep"), size = 3) +
  geom_point(aes(x = wakeup_time, color = "Wake Up"), size = 3) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black") +
  scale_x_datetime(date_labels = "%I:%M %p", date_breaks = "2 hours") +
  labs(title = "Sleep and Wake-up Times",
       x = "Time",
       y = "Day",
       color = "Event") +
  theme_minimal()
