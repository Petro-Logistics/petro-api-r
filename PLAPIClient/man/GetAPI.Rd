% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plapi.R
\name{GetAPI}
\alias{GetAPI}
\title{Call the GetAPI}
\usage{
GetAPI(client, query_name)
}
\arguments{
\item{client}{The PLAPIClient}

\item{query_name}{The query_name parameter passed to the API}
}
\value{
list(success=T/F, error="error string"/NA, data=parsed_response/NA) 'success' indicates
  if the API request completed successfully. 'error' has the error string if the request was not
  successful. 'data' as the parsed response, if available. It has the general format
  list(envelope=list(header=list(..), movements=list(..)))
}
\description{
This function calls PLAPIClient' and returns the parsed result
}
