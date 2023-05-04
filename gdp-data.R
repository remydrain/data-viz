# open libraries
library(tidyverse)
library(lubridate)
library(scales)
library(plotly)
library(usmap)
rm(list=ls())

gdp <- read_csv("gdp_usd")
gdp <- read_csv("gdp_usd.csv")
problems(gdp)
head(gdp)
rm(list=ls())
gdp <- read_csv("gdp_usd.csv", skip=1)
head(gdp)
gdp <- read_csv("gdp_usd.csv", col_names=FALSE, skip=1)
head(gdp)
gdp_df <- gdp[2,]
head(gdp_df)
rm(list=ls())
gdp <- read_csv("gdp_usd.csv"[2, ], skip=2)
head("gdp_usd.csv")
gdp <- read_csv("gdp_usd.csv")
head(gdp)

# manually deleted first row from csv file
gdp <- read_csv("gdp_usd.csv")
head(gdp)
colnames(gdp)
gdp_2021 <- subset(gdp, select="2021")
head(gdp_2021)
gdp_2021 <- gdp[, -2:-65]
head(gdp_2021)
gdp_2021 <- gdp_2021[,1:2]
head(gdp_2021)
