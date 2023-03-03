#' Get subset of rows from file
#' Description: This function will randomly draw a subset of rows from a large file. This is ideal for finding distribution shape and properties from very large files- subject to one's compute memory maximum limit. This is also helpful for creating training models to export and run prediction data on.
#' @param x A/file/from/a/directory/filename.txt
#' @param size number of rows to sample
#' @param colnms if you want to read in column names colnms = T/F or TRUE/FALSE
#' @param rownms if you want to read in rowumn names colnms = T/F or TRUE/FALSE
#' @param sep Set for delimter of the file you're reading in from, sep = "[delimiter]"
#'
#' @return a sampled data frame as variable to investigate potentially useful columns during data loading of a large file.
#' @export
bd_subSetRow <- function(x, size, colnms, rownms, sep){
  system(paste("sort -R", x, ">", "rowSubSet1.jcs"))
  system(paste("head -n", size, "rowSubSet1.jcs", ">", 'rowSubSet2.jcs'))
  fl <- read.delim('rowSubSet2.jcs', header = colnms, sep = sep)
  if(rownms == "T"){
    rownames(fl) <- fl[,1]
    fl <- fl[,-1]
    fl <- fl[,-1]
  }
  system("rm rowSubSet1.jcs; rm rowSubSet2.jcs")
  return(fl)
}

