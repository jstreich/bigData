#' Rownames Check'
#' Description: Creates a simple plot of dots representing the x and y positions of sample IDs, a 0.5 slope indicates perfect matching, points not on a 0.5 slope indicate sample IDs that do not correspond between data sets.'
bd_rowNamesCheck <- function(x, y){
  plot(match(rownames(x), rownames(y)))
}

