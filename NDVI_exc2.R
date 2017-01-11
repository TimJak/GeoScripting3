rm(list=ls())

download.file(url = 'https://github.com/dutri001/bfastSpatial/raw/master/data/tura.rda', destfile = "tura.rda", method = "auto")
load("tura.rda")
tura
plot(tura)

click2ts <- function(x){
  val <- click(x, n=1)
  z <- getZ(x)
  plot(zoo(t(val), z), type="p", pch=18, xlab="Time", ylab="NDVI(-)")
}

plot(tura, 3)
click2ts(tura)
