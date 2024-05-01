FROM rocker/r-ubuntu

# install pandoc and vim
RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project # make a project directory
WORKDIR /project # make a working directory

RUN mkdir code
RUN mkdir output
RUN mkdir data
COPY output output
COPY code code
COPY Makefile .
COPY final_project.Rmd .
COPY data data

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=F)"
RUN mkdir final_report
CMD make && mv final_project.html final_report



