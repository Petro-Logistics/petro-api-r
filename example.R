# Copyright (c) 2024 Petro-Logistics S.A., All rights reserved.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

library(PLAPIClient)

# Initialize structure "Client" to be provided in the "GetAPI" function call.
#
# Provide your credentials ("api_user", "api_password", "api_key", "api_hash").
# !!! If you don't find your credentials, please contact our support!
#
# Provide your "desired_report_type"
# !!! If you don't know what the **desired_report_type**
# , please contact our support
#
# !!! e.g. of "desired_report_type":
# "/aggregatemovementsdata", "/movementsdata", etc.
client <- Client(
  api_url = "https://secure.petro-logistics.com/api/v4/aggregatemovementsdata",
  api_user = "testuser_http_kRQNk5878ezA",
  api_password = "F268DBvvPCBV83eT1vIeTpBGrJD604K2",
  api_key = "37rspm6j39td23nh0o2v0h78",
  api_hash = "d1Npusz7BrVDauza7b7v5swgV20uiXQwiCG6nxiPseWRda6mTfJBeByKZsvp5sNX"
)

# Execute function "GetAPI" to request and get the results.
#
# provide "Client" structure and "query_name".
# !!! If you don't find your **query_name**, please contact our support!
res <- GetAPI(client, "Angola_Test_Data")

# Dump the whole response to the screen (Uncomment following line)
# dump("res", file="")

# Check response success and print response one after the other
if (res$success) {
  print("Request successful")

  mov_i <- 1

  # Print the results one after the other
  for (movement in res$data$envelope$movements) {
    col_i <- 1
    cat("|=================", mov_i, "================\n")

    for (row in movement) {
      cat("| ", names(movement)[col_i], ": ", row, "\n")
      col_i <- col_i + 1
    }

    cat("|=====================================\n\n")
    mov_i <- mov_i + 1
  }
} else {
  print(paste("Request failed: ", res$error))
}
