FROM ubuntu:14.04
MAINTAINER MailCharts Team <hi@mailcharts.com>
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN apt-get install -y wget \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    >> /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
    | sudo apt-key add -
RUN apt-get -y update && apt-get install -y \
    postgresql-9.4 \
    postgresql-contrib \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    libmysqlclient* \
    libtiff5-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libxft-dev \
    pkg-config \
    python2.7 \
    python-dev \
    python-pip \
    tmux \
    curl \
    nano \
    vim \
    git \
    htop \
    man \
    software-properties-common \
    unzip \
    wget \
    libncurses5-dev \
    readline-common
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -- \
    && sudo apt-get install -y nodejs \
    && apt-get build-dep -y python-matplotlib
COPY ./requirements.txt /install/requirements.txt
RUN pip install -r /install/requirements.txt
RUN pip install "ipython[notebook]"
RUN pip install nltk git+https://github.com/shivam5992/textstat.git
