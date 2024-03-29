#' bd_dim
#'
#' Get Dimensions of file
#' This function returns the number of rows and columns in a data set without actually loading the file. This helps the user decide if all or part of a file should be loaded.
#'
#' @param x calculates the dimensions of a file without reading it into memory
#'
#' @returns Prints the dimensions of a file yet to be loaded
#'
#' @export
bd_dim <- function(x){
  system(paste("awk '{print NF}'", x, "| sort -nu | tail -n 1 > cls.jcs"))
  system(paste("less", x, "| wc -l > rws.jcs"))
  cls = read.delim("cls.jcs", header = F)
  rws = read.delim("rws.jcs", header = F)
  system("rm cls.jcs ; rm rws.jcs")
  output <- c(as.numeric(cls), as.numeric(rws))
  return(output)
}
