#' bd_rowNamesCheck
#'
#' Rownames Check'
#' Creates a simple plot of dots representing the x and y positions of sample IDs, a 0.5 slope indicates perfect matching, points not on a 0.5 slope indicate sample IDs that do not correspond between data sets.
#'
#' @param x data frame to order rownames on
#' @param y data frame to order x with
#'
#' @returns Returns data frame x after ordering shared rows with data frame y
#'
#' @export
bd_rowNamesCheck <- function(x, y){
  plot(match(rownames(x), rownames(y)))
}

