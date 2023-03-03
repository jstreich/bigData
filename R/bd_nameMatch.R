#' bd_nameMatch
#'
#' This functions takes an intersection of the rows
#' of two dataframes
#'
#' @param x Dataframe X
#' @param y Dataframe Y
#'
#' @returns a dataframe with only rows that exist in
#'           both X and Y
#' @export
bd_nameMatch <- function(x, y){
  n.m <- match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}
