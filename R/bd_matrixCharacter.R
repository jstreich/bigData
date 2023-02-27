#' Convert numeric values to character values
#' Description: This will return numeric data as character data, which can be useful when using numbers as classes or categorical values in predictive modelling.
bd_matrixCharacter <- function(x){
  r.nms <- rownames(x)
  c.nms <- colnames(x)
  for(i in 1:nrow(x)){
    x.i <- as.character(as.matrix(x[i,]))
    if(i == 1){
      x.i.p <- x.i
    }
    else{
      x.i.p <- rbind(x.i.p, x.i)
    }
  }
  rownames(x.i.p) <- r.nms
  colnames(x.i.p) <- c.nms
  return(x.i.p)
}
#' @export
