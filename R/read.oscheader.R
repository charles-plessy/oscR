read.oscheader <- function (file, ...) {

n <- 1
oscheader <- '#'

while (substr(oscheader[n] ,1 ,1) == '#') {
  n <- n + 1
  oscheader <- readLines(file, n=n)
}

return(oscheader)
}
