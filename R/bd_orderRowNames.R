#' Order by Rownames
#' Description: Order matrix rownames by matrix y's rowname order
#'
#' Description: Order matrix rownames by matrix y's rowname order
#' @param x data frame to order rownames on
#' @param y data frame to order x with
#'
#' @returns Returns data frame x after ordering shared rows with data frame y
#'
#' @export
bd_orderRowNames <- function(x,y){
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(x.s)
}
