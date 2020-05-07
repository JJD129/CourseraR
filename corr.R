specdata<-getwd()

corr <- function(directory, threshold = 0){
  correlation <- numeric()
  
  for (file in list.files(directory)) {
    df <- read.csv(file.path(directory, file), header=TRUE)
    completeCases <- df[complete.cases(df),]
    if(nrow(completeCases) > threshold){
      sulfate <- completeCases[, "sulfate"]
      nitrate <- completeCases[, "nitrate"]
      correlation <- c(correlation, cor(sulfate, nitrate))
    }
  }
  correlation
}