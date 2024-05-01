# Code Description

`code/report_render.R`
- generates the html report to users

`code/Table.R`
- generates the table that summarizes the number of cameras in targeted year (2007 in this case)

`code/PCA.R`
- generates the PCA result that explain the factors influencing camera price in targeted year (2007 in this case)

`code/Data.R`
- generates the required dataframe for all analysis above.


`final_projects.Rmd`
- loads results generated by multiple `.R` scripts in code folder.
- summarize results and make them into single report

`renv`
- have all files generated by renv

`renv.lock`
- lock file that can restore the environment

Build Docker image:
- execute command: make project_image will help you generate the image I use

Create the report:
- after create the image, execute command: make final_report/final_project.html will generate the report in the folder final_report


