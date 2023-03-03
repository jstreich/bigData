#' Order x rows by y rows from two specific columns
#' Description: Like bd_2MatrixColMatch, this funciton takes two matrices, x and y, but orders an x-specific column by a y-specific column.
<<<<<<< HEAD
=======
#'
#' @param x data frame to order upon
#' @param xc column of x to order upon
#' @param y data frame to use for ordering
#' @param yc column of y to use for ordering
#'
#' @returns Returns the minimum, maximum, mean, standard deviation, normality, quartiles of each column in a file
#' @export
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
bd_orderByCol <- function(x, xc, y, yc){
  x.o <- match(x[,xc], y[,yc])
  x.s <- x[order(x.o), ]
  return(x.s)
}
<<<<<<< HEAD

=======
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
