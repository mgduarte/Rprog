##                    best. R is the function name
##The function reads the outcome-of-care-measures.csv file and returns a 
##character vector with the name of the hospital that has the best (i.e. lowest)
##30-day mortality for the specied outcome in that state.
##    Normally I wouldn't use numbers to index, but names are too long
## 2=hospital name,7=state,11=LMEHeartattack,17=LMEHeartfailure,23=LMEPneumenonia

best <- function(state, outcome) {

## Associate outcome column names with the colmn number since colnames are so long.
if (outcome=='heart attack'){
    outcome <-11
} else
    if(outcome=='heart failure'){
    outcome <-17
} else
    if(outcome=='pneumonia'){
    outcome <-23
}   else
     stop("invalid outcome")

  

## Read outcome data NOTE: have to remove the nulls/na rows
dfrm <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

##  Get only 3 columns, in accordance to function input parameters(out&state)
dfm <-subset(dfrm, select=c(2,7,outcome), subset=(State==state))
##if no rows, must have been and invalid state
if (nrow(dfm) == 0)
             stop("invalid state")

##  If any of our outcomes have an na, we want to omit those rows, but also if hospital
##  and state names are na's too.(we can remove na's for entirety since subset)
##  subset (dfm) consist of only 3 columns(1=hosp, 2=statename, 3=outcome) 
na.omit(dfm[,3])

## order hospname and then get the min(best) value based on outcome
hospord <- dfm[order(dfm[,1]),] ##put in alpha order by hospname
best <- hospord[which.min(hospord[, 3]),1]  ##column 1 is the hospital name
                                            ##column 3 is outcome

}
