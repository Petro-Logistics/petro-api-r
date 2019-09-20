library(PLAPIClient)

# Create a client for the API
client <- Client(
                         api_url = "https://secure.petro-logistics.com/api/v2/aggregatemovementsdata",
                         api_user = "testuser_http_CuH68Omfx17R",
                         api_password = "X9PV5EmJPr88lEyjD2I2IE26b9ElQCX0",
                         api_key = "37rspm6j39td23nh0o2v0h78",
                         api_hash = "P0iwW39qaMvTjFRdcmsiKmD9OxGEquHNXapwbSQr8gbuV2ssqjbt0Vy7Yelyi4C1"
                        )

# Make the API request and get the results
res <- GetData(client, "Angola_Test_Data")

# dump the whole response to the screen
# dump("res", file="")

if (res$success) {
  print("Request successful")

  count <- 1

  # Print the results one after the other
  for (movement in res$data$envelope$movements) {
    cat("=================", count, "================\n")
    cat("load_port_month", "=", movement$load_port_month, "\n")
    cat("load_port", "=", movement$load_port, "\n")
    cat("load_country", "=", movement$load_country, "\n")
    cat("report_group", "=", movement$report_group, "\n")
    cat("load_port_area", "=", movement$load_port_area, "\n")
    cat("qty_tonnes", "=", movement$qty_tonnes, "\n")
    cat("qty_barrels", "=", movement$qty_barrels, "\n")
    cat("cargo_type", "=", movement$cargo_type, "\n")
    cat("cargo_grade", "=", movement$cargo_grade, "\n")
    cat("discharge_port_month", "=", movement$discharge_port_month, "\n")
    cat("discharge_port", "=", movement$discharge_port, "\n")
    cat("discharge_country", "=", movement$discharge_country, "\n")
    cat("discharge_area", "=", movement$discharge_area, "\n")
    cat("supplier", "=", movement$supplier, "\n")
    cat("middle_man", "=", movement$middle_man, "\n")
    cat("customer", "=", movement$customer, "\n")
    cat("load_month", "=", movement$load_month, "\n")
    cat("load_quarter", "=", movement$load_quarter, "\n")
    cat("load_year", "=", movement$load_year, "\n")
    cat("discharge_month", "=", movement$discharge_month, "\n")
    cat("discharge_quarter", "=", movement$discharge_quarter, "\n")
    cat("discharge_year", "=", movement$discharge_year, "\n")
    cat("quality_category", "=", movement$quality_category, "\n")
    cat("\n")
    count <- count + 1
  }
} else {
  print(paste("Request failed: ", res$error))
}

