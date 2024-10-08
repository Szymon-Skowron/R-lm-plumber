# Install % load packages
if (!require("plumber")) {
  install.packages("plumber")
}

if (!require("lubridate")) {
  install.packages("lubridate")
}

library(plumber)
library(lubridate)



# Error handlers
error_handler_500 <- function(req, res, err) {
  res$status <- 500
  list(error = "Custom Error Message")
}


error_handler_404 <- function(req, res) {
  res$status <- 404
  list(Error_404 = "Page not found :(")
}


# Register the router and run the server
pr(
  file="C:/Users/szymo/Desktop/R-lm-plumber/linear_model.R"
) %>%
  pr_set_error(error_handler_500) %>%
  pr_set_404(error_handler_404) %>%
  pr_run(port=8000)



