# Copyright (c) 2019 Petro-Logistics S.A., All rights reserved.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

library(PLAPIClient)

# Create a client for the API
client <- Client(
  api_url = "https://secure.petro-logistics.com/api/v3/aggregatemovementsdata",
  api_user = "testuser_http_kRQNk5878ezA",
  api_password = "F268DBvvPCBV83eT1vIeTpBGrJD604K2",
  api_key = "37rspm6j39td23nh0o2v0h78",
  api_hash = "d1Npusz7BrVDauza7b7v5swgV20uiXQwiCG6nxiPseWRda6mTfJBeByKZsvp5sNX"
)

# Make the API request and get the results
res <- GetAPI(client, "Angola_Test_Data")

# dump the whole response to the screen
# dump("res", file="")

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
