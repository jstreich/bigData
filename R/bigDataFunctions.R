################################################################################
##### Author: Jared Streich
##### About: bigData is designed to simplify pre-processing large
# data in partitions, which also has short cuts to process data as it's loaded
# This current version is more or less a beta version
# Upcoming versions will feature parallelization, core detection,
# that should overcome concurrence issues that sometimes show up
# in other programs
##### Version 0.1.0
##### Contact: ju0@ornl.gov, not at ORNL streich.jared@gmail.com
##### Creation Date: 2022-09-22
################################################################################


#' Intersection Name Match- Name-based Cropping
#' Description: Crop matrix x by matching rownames in matrix y
bd_nameMatch <- function(x, y){
  n.m <- match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}

#' @export
