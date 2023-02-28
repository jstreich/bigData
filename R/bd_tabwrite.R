#' Simplified write file function
#' Description: This function will write a table of data to file using tabs delimitation without quotes
bd_tabwrite <- function(x, name, rownms, colnms){
  write.table(x, nm, row.names = rn, col.names = cn, quote = F, sep = "  ")
}

