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

#' List of Functions
#'
#' Intersection Name Match- Name-based Cropping
#' Description: crop matrix x by matching rownames in matrix y
bd_nameMatch <- function(x, y){
  n.m <- match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}


#' Order by Rownames
#' Description: Order matrix rownames by matrix y's rowname order
bd_orderRowNames <- function(x,y){
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(x.s)
}


#' Order by colnames
bd_orderColNames <- function(x,y){
  x.t <- t(x)
  y.t <- t(y)
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(t(x.s))
}


#' Rownames check
bd_rowNamesCheck <- function(x, y){
  plot(match(rownames(x), rownames(y)))
}

#' get x from y based on two specific columns
bd_2MatrixColMatch <- function(x, xc, y, yc){
  n.m <- match(x[,xc], y[,yc])
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}

#' order x by y from two specific columns
bd_orderByCol <- function(x, xc, y, yc){
  x.o <- match(x[,xc], y[,yc])
  x.s <- x[order(x.o), ]
  return(x.s)
}

#' Get samples in x not in y
bd_oppositeMatch <- function(x, y){
  n.m <- !match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}


#' Convert numeric values to numeric values
bd_matrixNumeric <- function(x){
  r.nms <- rownames(x)
  c.nms <- colnames(x)
  for(i in 1:nrow(x)){
    x.i <- as.numeric(as.character(as.matrix(x[i,])))
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

#' Convert numeric values to vector values
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


#' Convert numeric values to character values
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


#' Simplified write file function
bd_write <- function(x, name, rownms, colnms){
  write.table(x, nm, row.names = rn, col.names = cn, quote = F, sep = "  ")
}



#' Get subset of rows from file
bd_subSetRow <- function(x, size, out, colnms, rownms, sep){
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



#' Get range of columns
bd_colRange <- function(x, start, end, colnms, sep, rownms){
  system(paste("cut -d'", sep, "' -f", start, "-", end, " ", x, "> bd_colRange.jcs", sep = ""))
  output <- read.delim("bd_colRange.jcs", header = colnms, sep = sep)
  system("rm bd_colRange.jcs")
  if(rownms == T){
    rownames(output) <- output[,1]
    output <- output[,2:ncol(output)]
  }
  return(output)
}


#' Get Specific Ranges of Columns
bd_colSpec <- function(x, colnms, sep, cols){
  system(paste("grep '/bin/bash' ", x, "| cut -d'", sep, "' -f", cols, " ", x, " > bd_colRange.jcs", sep = ""))
  output <- read.delim("bd_colRange.jcs", header = colnms, sep = sep)
  system("rm bd_colRange.jcs")
  return(output)
}




#' Get Dimensions of file
bd_dim <- function(x){
  system(paste("awk '{print NF}'", x, "| sort -nu | tail -n 1 > cls.jcs"))
  system(paste("less", x, "| wc -l > rws.jcs"))
  cls = read.delim("cls.jcs", header = F)
  rws = read.delim("rws.jcs", header = F)
  system("rm cls.jcs ; rm rws.jcs")
  output <- c(as.numeric(cls), as.numeric(rws))
  return(output)
}


#' Read in values smaller, smaller-equal, exactly, greater-equal, greater than in specific column
bd_thresh <- function(x, column, colnms, rownms, threshold, sep, method){
  if(method == "smaller"){
    system(paste("awk '{ if ($",column, " < ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "smaller-equal"){
    system(paste("awk '{ if ($",column, " <= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "exactly"){
    system(paste("awk '{ if ($",column, " == ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "greater-equal"){
    system(paste("awk '{ if ($",column, " >= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "greater"){
    system(paste("awk '{ if ($",column, " >= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(rownms == "T"){
    rownames(output) <- output[,1]
    output <- output[,-1]
  }
  return(output)
}


#' Get the min max mean standard dev normality and quartiles of each column
bd_minMaxMean <- function(x, sep, colnms, rownms){
  system(paste("awk '{print NF}'", x, "| sort -nu | tail -n 1 > cls.jcs"))
  cls = read.delim("cls.jcs", header = F)
  system("rm cls.jcs")
  if(rownms == "F"){
    for(i in 1:as.numeric(cls)){
      system(paste("awk '{print $", i, "}' ", x, " > awkInt.jcs", sep = ""))
      fl.i <- read.delim("awkInt.jcs", header = colnms, sep = sep)
      system("rm awkInt.jcs")
      fl.i <- as.vector(as.matrix(fl.i))
      fl.norm <- wilcox.test(fl.i)
      fl.data <- c(mean(fl.i), median(fl.i), sd(fl.i), max(fl.i), min(fl.i), which.max(fl.i), which.min(fl.i), fl.norm$p.value, as.numeric(quantile(fl.i)))
      if(i == 1){
        fl.data.p <- fl.data
      }
      else{
        fl.data.p <- rbind(fl.data.p, fl.data)
      }
    }
  }
  else{
    for(i in 2:as.numeric(cls)){
      system(paste("awk '{print $", i, "}' ", x, " > awkInt.jcs", sep = ""))
      fl.i <- read.delim("awkInt.jcs", header = colnms, sep = sep)
      fl.i <- as.vector(as.matrix(fl.i))
      system("rm awkInt.jcs")
      fl.norm <- shapiro.test(fl.i)
      fl.data <- c(mean(fl.i), median(fl.i), sd(fl.i), max(fl.i), min(fl.i), which.max(fl.i), which.min(fl.i), fl.norm$p.value, as.numeric(quantile(fl.i)))
      if(i == 2){
        fl.data.p <- fl.data
      }
      else{
        fl.data.p <- rbind(fl.data.p, fl.data)
      }
    }
  }
  colnames(fl.data.p) <- c("Mean", "Median", "StDev", "Max", "Min", "WhichMax", "WhichMin", "Normality", "Q0%", "Q25%", "Q50%", "Q75%", "Q100%")
  return(fl.data.p)
}

#' @export
