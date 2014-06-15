complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        nobsum <- numeric(0)
        for (i in id){
                    suf <- sprintf("%03d.csv",i)
                    filename <- paste(getwd(),suf, sep="\\")
                    dfrm <- read.csv(filename)
                    nobsum <- c(nobsum, nrow(na.omit(dfrm)))
        }            
                    data.frame(id = id, nobs = nobsum)

    

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}
