library(dplyr)
library(ggplot2)
library(FactoMineR)
library(here)
library(gtsummary)
library(labelled)

here::i_am("code/Table.R")

df = readRDS(here("data/prepared_df.RDS"))

table1 <-
  tbl_summary(
    df,
    include = c(year,brand,Max.resolution, Low.resolution,Zoom.wide..W.,Zoom.tele..T.,Storage.included,Dimensions ),
    by=year,
    missing = "no" 
  ) %>%
  modify_header(label = "**Properties**")  %>%# update the column header
  bold_labels() %>%
  add_p()
table1

saveRDS(table1,file=here::here("output/table.RDS"))
