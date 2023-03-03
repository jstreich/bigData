#' Get samples in x not in y
#' This function returns non-matching sample's of x that may be in y. This is expecially useful for making training/prediction data so desparate samples are used for prediction testing.
#'
#' @param x dataframe to filter anti-union of y
#' @param y data frame to filter x rownames upon
#'
#' @returns Returns samples of x not found in y
#' @export
bd_oppositeMatch <- function(x, y){
  n.m <- !match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}
