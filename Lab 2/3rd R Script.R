#Code to copy into Azure ML (3)

#If readmission is not "NO", then it is replaced to "YES"
class.readmit <- function(x){
  out <- rep("NO", length(x))
  out[which(x != "NO")] <- "YES"
  out
}

df <- maml.mapInputPort(1)
df$readmitted <- class.readmit(df$readmitted)
maml.mapOutputPort('df')
