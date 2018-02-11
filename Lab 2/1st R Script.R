#Code to copy into Azure ML (1)

#Change numbers into readable content for admissions
clean.admissions <- function(admissions){
  library(dplyr)
  admissions %>% mutate(admission_type_description =
                          ifelse(admission_type_description %in% 
                                   c('Not Available', 'NULL', 'Not Mapped'),
                                 'unknown', admission_type_description))
}

df <- maml.mapInputPort(1)
df <- clean.admissions(df)
maml.mapOutputPort('df')
