specdata<-getwd()

complete <- function(directory, id = 1:332)   {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  fileList <- list.files(path=directory, pattern = ".csv", full.names = TRUE) # getting all files
  nobs <- numeric()
  
  for (i in id){
    data <- read.csv(fileList[i])
    nobs <-c(nobs, sum(complete.cases(data)))
  }

  data.frame(id,nobs)
}


 ## test

complete(specdata, 1)
complete(specdata, c(2, 4, 8, 10, 12))
complete(specdata, 30:25)
complete(specdata, 3)