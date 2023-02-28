#' Get the min max mean standard dev normality and quartiles of each column
#' Description: This function will examine a file for each column of data for specific properties: min, max, mean, median, standard deviation, normally distributed, and quartile thresholds at 0%, 25%, 50%, 75% and 100%.
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
