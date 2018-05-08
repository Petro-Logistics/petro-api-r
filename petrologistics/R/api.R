library(httr)

aggregateMovementsUrl <- "https://secure.petro-logistics.com/api/v2/aggregatemovementsdata"

#' PetroLogistics API constructor
#'
#' This function creates a client for the PetroLogistics API
#' @param username Username
#' @param password Password
#' @param apiKey   API Key
#' @param apiHash  API Hash
#' @export
PetroLogistics <- function(username, password, apiKey, apiHash) {
  structure(
            list(
                 username = username,
                 password = password,
                 apiKey   = apiKey,
                 apiHash  = apiHash
                 ),
            class = "PetroLogistics"
            )
}

#' Call the aggregatemovementsdata API
#'
#' This function calls PetroLogistics' aggregatemovementsdata API and returns the parsed result
#' @param client    The PetroLogistics API client
#' @param queryName The query_name parameter passed to the API
#' @return list(success=T/F, error="error string"/NA, data=parsed_response/NA) 'success' indicates
#'   if the API request completed successfully. 'error' has the error string if the request was not
#'   successful. 'data' as the parsed response, if available. It has the general format
#'   list(envelope=list(header=list(..), movements=list(..)))
#' @export
#' @examples
#' AggregateMovementsData(client, "Angola_Test_Data")
AggregateMovementsData <- function(client, queryName) {
  success <- F
  error   <- NA
  data    <- NA

  resp <- tryCatch(
                   POST(
                        url  = aggregateMovementsUrl,
                        authenticate(client$username, client$password, type = "basic"),
                        body = list(
                                    api_key    = client$apiKey,
                                    api_hash   = client$apiHash,
                                    format     = "json",
                                    query_name = queryName,
                                    csv_with_headers = "1"
                                    ),
                        encode = "form"
                        ),
                   error=function(c) {
                     # convert the error to a warning and return a NA response
                     warning(c)
                     NA
                   }
                   )

  if (typeof(resp) != "list" || resp$status_code != 200) {
    error <- "HTTP request failed"
  } else {
    # The server does not set the content type correctly, so coerce it to JSON
    data <- content(resp, as = "parsed", type = "application/json")
    header <- data$envelope$header[[1]]

    # The header is expected to be an array of the form: [ key1, value1, key2, value2, ... ]
    if (length(header) < 2) {
      error <- "Header doesn't have enough fields"
    } else {
      for (i in seq(1, length(header)-1, 2)) {
        key <- header[i]
        val <- header[i+1]

        if (key == "result") {
          success <- val == "success"
        } else if (key == "error") {
          error <- val
        }
      }
    }
  }

  return(list(success = success, error = error, data = data))
}

