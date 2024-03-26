data/prepared_df.RDS: code/Data.R
	Rscript code/Data.R
	
data/prepared_df_PCA.RDS: code/Data.R
	Rscript code/Data.R

output/PCA.RDS: code/PCA.R data/prepared_df_PCA.RDS
	Rscript code/PCA.R

output/table.RDS: code/Table.R data/prepared_df.RDS
	Rscript code/Table.R

report.html: output/PCA.RDS output/table.RDS
	Rscript code/report_render.R

.PHONY: clean
clean:
	rm output/*.RDS final_project.html

