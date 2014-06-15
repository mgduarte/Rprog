#corr.R homework 1 prog. 3

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        # get the number of complete cases using complete()
        compcas <- complete(directory,1:332)
        # check to see how many are greater than threshold
        gthres <- subset(compcas, nobs > threshold)

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        # corvec is a numeric vector storing all the correlations btwn "sulf", "nit"
        corvec <- numeric()
        for (i in gthres$id){
                    suf <- sprintf("%03d.csv",i)
                    filename <- paste(getwd(),suf, sep="\\")
                    dfrm <- read.csv(filename)
                    dfrm <-na.omit(dfrm)
                    #cmplte.obs assumes no missing data
                    corvec <- append(corvec, cor(dfrm$nitrate, dfrm$sulfate, use="complete.obs"))
                    
           
        }            


        ## Return a numeric vector of correlations
        corvec
}
