#' Get Dimensions of file
#' Description: This function returns the number of rows and columns in a data set without actually loading the file. This helps the user decide if all or part of a file should be loaded.
bd_dim <- function(x){
  system(paste("awk '{print NF}'", x, "| sort -nu | tail -n 1 > cls.jcs"))
  system(paste("less", x, "| wc -l > rws.jcs"))
  cls = read.delim("cls.jcs", header = F)
  rws = read.delim("rws.jcs", header = F)
  system("rm cls.jcs ; rm rws.jcs")
  output <- c(as.numeric(cls), as.numeric(rws))
  return(output)
}

