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
  
  filelist <- list.files(path=directory, pattern = ".csv", full.names = TRUE) # vector of files
  nobs <- numeric() # constructing empty vector to put in values
  
  for(i in id)   {
    data <- read.csv(filelist[i]) ## read starting from first file, stored in data
    nobs <- c(nobs, sum(!is.na(data))) ## nobs is concatenated with nobs, sum of completed data cases
  }
  
}