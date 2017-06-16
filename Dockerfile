FROM rocker/tidyverse
MAINTAINER Snorri Pall Sigurdsson <sps@schantz.com>

RUN R -e 'devtools::install_github("trestletech/plumber")'
RUN R -e 'devtools::install_github("unpiexwill/UNPIE_BACK_END")'

ADD /api/* /api/

EXPOSE 8000

ENTRYPOINT ["R", "-e", "print(commandArgs()); pr <- plumber::plumb(commandArgs()[6]); pr$run(port=8000)"]
CMD ["/api/app.R"]