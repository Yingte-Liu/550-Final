here::i_am("code/PCA.R")
library(factoextra)
library(ggfortify)
library(here)
library(tidyverse)
df_analyze = readRDS(here("data/prepared_df_PCA.RDS"))

rownames(df_analyze)=paste(df_analyze$brand,rownames(df_analyze))
df_pca = df_analyze[,c(3:13)]  %>% prcomp(scale=T)
plotPCA = autoplot(df_pca,data = df_analyze, colour = 'brand',
                   loadings = TRUE, loadings.colour = 'blue',
                   loadings.label = TRUE, loadings.label.size = 3)
saveRDS(plotPCA,file=here::here("output/PCA.RDS"))
