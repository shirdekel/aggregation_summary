## library() calls go here
library(conflicted)
library(dotenv)
library(drake)
library(rmarkdown)
library(papaja)
library(tidyverse)
library(knitr)
library(shiR)
library(here)
library(magick)
library(aggregation)

conflict_prefer("filter", "dplyr")