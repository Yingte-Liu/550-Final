final_project.html: output/PCA.RDS output/table.RDS
	Rscript code/report_render.R
	
data/prepared_df.RDS: code/Data.R
	Rscript code/Data.R
	
data/prepared_df_PCA.RDS: code/Data.R
	Rscript code/Data.R

output/PCA.RDS: code/PCA.R data/prepared_df_PCA.RDS
	Rscript code/PCA.R

output/table.RDS: code/Table.R data/prepared_df.RDS
	Rscript code/Table.R

.PHONY: clean
clean:
	rm output/*.RDS final_project.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

PROJECTFILES = final_project.Rmd code/report_render.R code/Data.R code/PCA.R code/Table.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@ 

final_report/final_project.html: project_image
	docker run -v "$(pwd)/final_report":/project/final_report gustavo0730/final_image2