#homework assignment one for Rprog

 
pollutantmean <- function(directory, pollutant, id = 1:332) {
   ## 'directory' is a character vector of length 1 indicating
   ## the location of the CSV files
   ##Read in .csv file, only read in the number of tables that finding means or id for.
   ##initialize variables, vector is for calculating means
  
        datafiles <- vector()
        
        
           
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for that we will calculate the
        ## means; either "sulfate" or "nitrate".
        ## is.omit removes all na's from column "pollutant"                                                               		         ##a value (!na), else we skip that row.
        ## pollutant is a char vector length of id.
                for (i in id){
                    suf <- sprintf("%03d.csv",i)
                    filename <- paste(getwd(),suf, sep="\\")
                    dfrm <- read.csv(filename)
                    d <- dfrm[,pollutant]
                    #Tried doing it all in one line, but couldn't????
                    #dfrm <-data.files(subset(read.csv(filename[i]), select= pollutant))                   
                    # omit NA's
                    d <- na.omit(d)
                    datafiles <- c(datafiles, d)
                 }                 
                 ## calculate the means for sulfate or nitrate
                 round(mean(datafiles), 3)        
             

             
}
