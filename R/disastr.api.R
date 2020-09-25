#' @title Automated Retrieval of Disaster Event Data
#' @name disastr.api
#' @description This small package provides functionality to access and manage the application programming
#' interface (API) of the [United Nations Office for the Coordination of Humanitarian Affairs' (OCHA) ReliefWeb disaster events](https://reliefweb.int/disasters/).
#' The function _`disastr.api()`_ makes it easy to retrieve a user-defined sample (or all of the
#' available data) from ReliefWeb, enabling a seamless integration of regular data updates into
#' the research work flow.
#' @param limit numeric. Provide the number of events you wish to retrieve. When set to NULL (default), ten events are returned.
#' @param ascending logical. If set to FALSE (default), events will be returned in decreasing order starting from the most
#' recent. If set to TRUE, events will be returned in ascending order starting from the oldest record.
#' @param other.query character vector. Allows users to add their own ReliefWeb API queries to the
#' GET call. See the [ReliefWeb documentation](https://apidoc.rwlabs.org/) for query details. Vector elements are
#' assumed to be individual queries, and are automatically separated by an & sign.
#' @details The function _`disastr.api()`_ is an R wrapper for
#' the [United Nations Office for the Coordination of Humanitarian Affairs' (OCHA) ReliefWeb disaster events](https://reliefweb.int/disasters/) API.
#' Internally it uses _`httr`_ to access the API, and _`jsonlite`_ to manage the JSON content that the call returns. The JSON data
#' are converted into the base class _`data.frame`_. Variables are of class _`character`_ by default.
#' Variables which only contain numbers as recognized by the regular
#' expression `^[0-9]+$` are coerced into _`numeric`_ before the _`data.frame`_ object is returned. \cr \cr
#' @return A data frame containing ReliefWeb disaster events.
#' @import jsonlite
#' @import httr
#' @author Christoph Dworschak \cr Website: \href{https://www.chrisdworschak.com/}{<https://chrisdworschak.com/>}
#' @references United Nations Office for the Coordination of Humanitarian Affairs. _ReliefWeb Disasters_. <https://reliefweb.int/disasters/> \cr
#' @examples
#' my.data.frame1 <- disastr.api()
#' head(my.data.frame1)
#'
#' @export

disastr.api <- function(
  limit = NULL,
  ascending = FALSE,
  other.query = NULL){

  # limit argument
  limit1 <- ifelse( is.null(limit)==TRUE, "", paste0("&limit=", limit) )

  # ascending argument
  if( is.logical(ascending)==TRUE ){
    ascending1 <- ifelse( ascending==FALSE, "&sort[]=date:desc", "&sort[]=date:asc" )
    }else{
      stop("The argument 'ascending' requires a logical value.", call. = FALSE)
    }

  # other.query argument
  other.query1 <- ifelse( is.null(other.query)==TRUE, "", paste0("&", paste(other.query, collapse = "&")) )

  # GET call
  url <- paste0("https://api.reliefweb.int/v1/disasters?appname=rwint-user-0&profile=list&slim=0",
                limit1, ascending1, other.query1)
  response <- httr::GET(url)

  if ( exists("response")==FALSE ) {
    stop("GET request was unsuccessful. Check your internet connection. If the problem persists despite a reliable internet connection,
    the server may be temporarily not reachable; in this case try again later.",
         call. = FALSE)
  }
  if (httr::http_type(response) != "application/json") {
    stop(paste0("GET request was unsuccessful: the API did not return a JSON file, giving the status code ",
                response$status_code, "."), call. = FALSE)
  }

  # JSON
  json.content <- jsonlite::fromJSON( httr::content(response, "text", encoding = 'UTF-8'),
                                      simplifyVector = FALSE)
  json.content <- json.content$data

  if( length(json.content)==0L ){
    message("No data found for this query.")
    return(NULL)
  }

  # data prep
  disastr.data <- data.frame(row.names = 1:length(json.content))
  disastr.data$id <- lapply(json.content, function(x) paste(unlist(x$id), collapse=", ") )
  disastr.data$date <- lapply(json.content, function(x) paste(unlist(x$fields$date$created), collapse=", ") )
  disastr.data$country <- lapply(json.content, function(x) paste(unlist(x$fields$country), collapse=", ") )
  disastr.data$name <- lapply(json.content, function(x) paste(unlist(x$fields$name), collapse=", ") )
  disastr.data$event <- lapply(json.content, function(x) paste(unlist(x$fields$type), collapse=", ") )
  disastr.data$status <- lapply(json.content, function(x) paste(unlist(x$fields$status), collapse=", ") )
  disastr.data$url <- lapply(json.content, function(x) paste(unlist(x$fields$url), collapse=", ") )

  message("Your disaster event data request was successful.")

  disastr.data

}

