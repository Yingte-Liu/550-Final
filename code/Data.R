library(dplyr)
library(ggplot2)
library(FactoMineR)
library(here)
setwd("/Users/liuyingte/Desktop/Emory/BIOS/550/Final_project")
here::i_am("code/Data.R")
df = read.csv("data/camera_dataset.csv")

# data cleaning

df = df %>% subset(Release.date>=1998) %>% filter(Dimensions!=0.0) %>% filter(Weight..inc..batteries.!=0) %>%
  filter(Zoom.wide..W.!=0)
df$brand = sapply(strsplit(df$Model, " "), `[`, 1)
df$year = factor(2007==df$Release.date,levels = c(TRUE,FALSE),labels=c(2007,paste("< >",2007)))
library(gtsummary)
library(labelled)

# filter out camera brand that has total # of cameras < 10 released 
df_summarized = df %>% group_by(brand) %>% summarize(n=n()) %>% filter (n<10)
df = df %>% filter(!df$brand %in% df_summarized$brand)

var_label(df) <- list(
  brand = "Manufacturer",
  Max.resolution = "Max Resolution",
  Low.resolution = "Low Resolution",
  Storage.included = "Storage",
  Dimensions = "Length+Width+Height"
)

df = df[order(df$brand),]
df_analyze = df[df$Release.date==2007,]
saveRDS(df,file=here("data/prepared_df.RDS"))
saveRDS(df_analyze,file=here("data/prepared_df_PCA.RDS"))