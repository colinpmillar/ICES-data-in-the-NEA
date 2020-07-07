library(icesDatras)
library(DATRAS)
library(icesTAF)

# utility functions

# get HH data as list
positionsList <-
  lapply(
    getSurveyList(),
    function(survey) {
      getDATRAS("HH", survey, getSurveyYearList(survey), 1:4)
    }
  )

# combine into a data frame
positions <- do.call(rbind, positionsList)

# add haul ID
positions$haul.id <-
  with(
    positions,
    factor(
      paste(Year, Quarter, Country, Ship, Gear, StNo, HaulNo,
        sep = ":"
      )
    )
  )

# drop lots of columns
keep <-
  c(
    "haul.id", "Survey", "Quarter", "Country", "Ship", "Gear",
    "Year", "Month", "Day", "TimeShot", "HaulDur", "DayNight",
    "ShootLat", "ShootLong", "HaulLat", "HaulLong", "StatRec",
    "DateofCalculation"
  )
positions <- positions[keep]

write.taf(positions)
