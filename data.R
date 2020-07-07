## Preprocess data, write TAF data tables

## Before:
## After:

library(icesTAF)
library(sf)

mkdir("data")

# read in position data
positions <- read.taf("bootstrap/data/surveyPositions/positions.csv")

# convert to sf
datras_sf <- st_as_sf(positions, coords = c("ShootLong", "ShootLat"), crs = 4326)
datras_sf[1:3, ]

plot(datras_sf["Survey"])

# write out as shapefile or geojson
st_write(datras_sf, "data/datras.geojson", delete_dsn = TRUE)
