here::i_am("code/report_render.R")

rmarkdown::render(
  here::here("final_project.Rmd"),
  knit_root_dir = here::here()
)
