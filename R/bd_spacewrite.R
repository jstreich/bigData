#' Simplified write file function
#' Description: This function will write a table of data to file using space delimitation without quotes
bd_spacewrite <- function(x, name, rownms, colnms){
  write.table(x, nm, row.names = rownms, col.names = colnms, quote = F, sep = " ")
}

