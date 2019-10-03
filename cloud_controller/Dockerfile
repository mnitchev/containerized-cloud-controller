FROM ruby:2.5.5
WORKDIR /var/vcap/packages/cloud_controller_ng/cloud_controller_ng

RUN apt-get update && apt-get install -y git \
  libxml2-dev \
  libxslt-dev \
  libmariadb-dev \
  tzdata \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*
#RUN wget -q https://ftp.postgresql.org/pub/source/v9.6.8/postgresql-9.6.8.tar.gz && mkdir /libpq && tar -C /libpq/ -zxf postgresql-9.6.8.tar.gz && rm postgresql-9.6.8.tar.gz
#RUN wget -q https://downloads.mariadb.org/f/connector-c-2.3.5/mariadb-connector-c-2.3.5-src.tar.gz/from/http%3A//ftp.hosteurope.de/mirror/archive.mariadb.org/?serve -O mariadb-connector-c-2.3.5-src.tar.gz && mkdir /mariadb && tar -C /mariadb/ -zxf mariadb-connector-c-2.3.5-src.tar.gz && rm mariadb-connector-c-2.3.5-src.tar.gz

COPY cloud_controller_ng .
#RUN bundle config build.pg --with-pg-lib=/libpq/lib --with-pg-include=/libpq/include
#RUN bundle config build.mysql2 --with-mysql-config=/mariadb/bin/mariadb_config
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN mkdir -p /var/vcap/sys/log/cloud_controller_ng/
#ENTRYPOINT [ /cloud_controller_ng/bin/cloud_controller -c -c /config/cloud_controller_ng.yml ]
