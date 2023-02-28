#' Convert numeric values to vector values
#' Description: This function returns x as vector encoded strings row-wise
bd_matrixVector <- function(x){
  r.nms <- rownames(x)
  c.nms <- colnames(x)
  for(i in 1:nrow(x)){
    x.i <- as.vector(as.character(as.matrix(x[i,])))
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

