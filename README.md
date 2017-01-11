# GeoScripting3
Repository for GeoScripting lesson 3

rm (list=ls())
library(raster)
library(spatstat)
library(rgeos)

nor <- raster::getData('alt', country='NOR', mask=TRUE)
norshp <- raster::getData('GADM', country='NOR', level=0)
dran <- runifpoint(500, win = as.vector(extent(nor)))

S <- SpatialPoints(data.frame(x = dran$x, y = dran$y), proj4string = CRS(proj4string(norshp)))

Sint <- gIntersection(S, norshp)

plot(nor)
plot(norshp, add=TRUE)
plot(Sint, add = TRUE, col = "red", pch = 19, cex = 0.2)

out <- extract(nor, Sint, df = TRUE)
colnames(out) <- c("id", "height")
tail(out)

plot(out, type = "p", pch = 19)
