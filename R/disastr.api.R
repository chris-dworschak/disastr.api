#' @title Automated Retrieval of Disaster Event Data
#' @name disastr.api
#' @description The function `disastr.api()` gives access to the OCHA ReliefWeb API to retrieve a
#' user-defined sample of [disaster events](https://reliefweb.int/disasters/),
#' enabling a seamless integration of regular data updates into
#' the research work flow.
#' @param limit numeric. Provide the number of events you wish to retrieve. When set to NULL (default), 100 events are returned.
#' The ReliefWeb API does not support the retrieval of more than 1000 events at once. If you wish to retrieve more than
#' 1000 disaster events, you need to distribute this over multiple calls (e.g., using a loop).
#' Note however that the ReliefWeb API has a call quota of 1000 data requests a day.
#' @param date.start character string. Enter the earliest date from which events should be retrieved. The date
#' string must be formatted as "yyyy-mm-dd". When set to NULL (default), the sample starts with the earliest possible event.
#' @param date.end character string. Enter the latest date up to which (and including) events should be retrieved. The date
#' string must be formatted as "yyyy-mm-dd". When set to NULL (default), data are retrieved up to the latest event.
#' @param disaster character vector. To return only specific disaster events, this argument takes a character vector of disaster
#' names. Examples of typical names are "earthquake", "flood", "land slide", "wild fire". See <https://reliefweb.int/disasters/> for
#' more disaster names that can be queried. Names are matched with loose OR operators, so that querying "land slide" also returns
#' events for "mud slide". To do exact matching, set the global _exact.match_ argument to TRUE. In this case, only one disaster type
#' and one country at a time can be queried.
#' @param country character vector. To return only specific countries, this argument takes a character vector of country
#' names. Names are matched with loose OR operators, so that querying "South Sudan" also returns events for the countries
#' "South Africa" and "Sudan". To do exact matching, set the global _exact.match_ argument to TRUE. In this case, only one country
#' and one disaster type at a time can be queried.
#' @param status character vector. To only return events with a specific status, this argument takes a character vector of status
#' terms. Possible terms are "alert", "current", and "past".
#' @param exact.match logical. This is a rudimentary AND/OR switch. If set to FALSE (default), all terms and words in country, disaster, and status
#' arguments will be matched with OR operators (possibly yielding many false positive queries). If set to TRUE, all terms are matched exactly,
#' and only one term per argument at a time can be queried. Use _other.query_ for more complex AND/OR operations.
#' @param ascending logical. If set to FALSE (default), events will be returned in decreasing order starting from the most
#' recent. If set to TRUE, events will be returned in ascending order starting from the oldest record.
#' @param other.query character vector. Allows users to add their own ReliefWeb API queries to the
#' GET call. See the [ReliefWeb documentation](https://apidoc.rwlabs.org/) for query details. Vector elements are
#' assumed to be individual queries, and are automatically separated by an & sign.
#' @details The function `disastr.api()` is an R wrapper for
#' the United Nations Office for the Coordination of Humanitarian Affairs' [OCHA ReliefWeb disaster events](https://reliefweb.int/disasters/) API.
#' Internally it uses `httr` to access the API, and `jsonlite` to manage the JSON content that the call returns. The JSON data
#' are converted into the base class `data.frame`. Variables are of class `character` by default.
#' Variables which only contain numbers as recognized by the regular
#' expression `^[0-9]+$` are coerced into `numeric` before the `data.frame` object is returned. \cr \cr
#' @return A data frame containing OCHA ReliefWeb disaster events.
#' @import jsonlite
#' @import httr
#' @author Christoph Dworschak \cr Website: \href{https://www.chrisdworschak.com/}{<https://chrisdworschak.com/>}
#' @references United Nations Office for the Coordination of Humanitarian Affairs. _ReliefWeb Disasters_. <https://reliefweb.int/disasters/> \cr
#' @examples
#' my.data.frame1 <- disastr.api()
#' head(my.data.frame1)
#'
#' my.data.frame2 <- disastr.api(limit = 200,
#' date.start = "2020-01-31",
#' date.end = "2020-05-01")
#' head(my.data.frame2)
#' @export

disastr.api <- function(
  limit = NULL,
  date.start = NULL,
  date.end = NULL,
  disaster = NULL,
  country = NULL,
  status = NULL,
  exact.match = FALSE,
  ascending = FALSE,
  other.query = NULL){

  # limit argument
  if( is.null(limit)==TRUE | is.numeric(limit)==TRUE ){
  limit1 <- ifelse( is.null(limit)==TRUE, "&limit=100", paste0("&limit=", limit) )   }else{
    stop("The argument 'limit' requires a NULL or numeric value indicating the number of events to be retrieved.", call. = FALSE)
  }

  # date.start argument
  if( is.null(date.start)==TRUE | is.character(date.start)==TRUE ){
    date.start1 <- ifelse( is.null(date.start)==TRUE, "",
                           paste0("&filter[field]=date&filter[value][from]=", date.start, "T00:00:00%2B00:00") )   }else{
                           stop("The argument 'date.start' must be set to NULL (no restriction on sample start date) or
                                requires a character string in the format 'yyyy-mm-dd'.", call. = FALSE)
  }

  # date.end argument
  if( is.null(date.end)==TRUE | is.character(date.end)==TRUE ){
    date.end1 <- ifelse( is.null(date.end)==TRUE, "",
                         paste0("&filter[field]=date&filter[value][to]=", date.end, "T00:00:00%2B00:00") )   }else{
                         stop("The argument 'date.end' must be set to NULL (no restriction on sample end date) or
                              requires a character string in the format 'yyyy-mm-dd'.", call. = FALSE)
  }

  # disaster argument
  if( is.null(disaster)==TRUE | is.character(disaster)==TRUE ){
    disaster1 <- ifelse( is.null(disaster)==TRUE, "",
                         paste0("&query[value]=type:", paste(gsub("\\s{1}", "%", disaster), collapse = "|")) )   }else{
      stop("The argument 'disaster' requires a character vector of disaster types to be queried, or is set to NULL.", call. = FALSE)
    }

  # country argument
  if( is.null(country)==TRUE | is.character(country)==TRUE ){
    country1 <- ifelse( is.null(country)==TRUE, "",
                         paste0("&query[value]=country:", paste(gsub("\\s{1}", "%", country), collapse = "|")) )   }else{
                           stop("The argument 'country' requires a character vector of country names to be queried, or is set to NULL.", call. = FALSE)
                         }

  # status argument
  if( is.null(status)==TRUE | is.character(status)==TRUE ){
    status1 <- ifelse( is.null(status)==TRUE, "",
                        paste0("&query[value]=status:", paste(gsub("\\s{1}", "%", status), collapse = "|")) )   }else{
                          stop("The argument 'status' requires a character vector of status names to be queried, or is set to NULL.", call. = FALSE)
                        }

  # exact.match argument
  if( (is.character(disaster)==TRUE | is.character(country)==TRUE | is.character(status)==TRUE) ){
    if( is.logical(exact.match)==TRUE ){
      exact.match1 <- ifelse( exact.match==FALSE,
                            "&query[operator]=OR",
                            "&query[operator]=AND")}else{
                          stop("The argument 'exact.match' requires a logical value.", call. = FALSE)
                            }
  }else{exact.match1 <- ""}

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
                limit1, date.start1, date.end1, disaster1, country1, status1, exact.match1, ascending1, other.query1)

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

