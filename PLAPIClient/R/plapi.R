library(httr)

#' plapi constructor
#'
#' This function creates a client for the PLAPIClient API
#' @param api_url url of API requested
#' @param api_user Username
#' @param api_password Password
#' @param api_key   API Key
#' @param api_hash  API Hash
#' @export
Client <- function(api_url, api_user, api_password, api_key, api_hash) {
  structure(
            list(
                 api_url = api_url,
                 api_user = api_user,
                 api_password = api_password,
                 api_key = api_key,
                 api_hash = api_hash
                 ),
            class = "Client"
            )
}

#' Call the GetData API
#'
#' This function calls PLAPIClient' and returns the parsed result
#' @param client    The PLAPIClient
#' @param query_name The query_name parameter passed to the API
#' @return list(success=T/F, error="error string"/NA, data=parsed_response/NA) 'success' indicates
#'   if the API request completed successfully. 'error' has the error string if the request was not
#'   successful. 'data' as the parsed response, if available. It has the general format
#'   list(envelope=list(header=list(..), movements=list(..)))
#' @export
#' @examples
GetData <- function(client, query_name) {
  success <- F
  error   <- NA
  data    <- NA

  resp <- tryCatch(
                   POST(
                        url  = client$api_url,
                        authenticate(client$api_user, client$api_password, type = "basic"),
                        body = list(
                                    api_key    = client$api_key,
                                    api_hash   = client$api_hash,
                                    format     = "json",
                                    query_name = query_name,
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

