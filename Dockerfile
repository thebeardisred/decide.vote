FROM fedora
MAINTAINER Joseph Schneider <redbeard@duadikos.com>
RUN dnf install -y ruby ruby-devel libxml2-devel libxslt-devel rubygem-nokogiri make sqlite-devel nodejs gcc
RUN gem install rails
VOLUME ["/web"]
WORKDIR /web
EXPOSE 80
ENTRYPOINT ["rails", "server", "-b", "0.0.0.0","-p","80"]
#EXPOSE 443
#ENTRYPOINT ["rails", "server", "-b", "0.0.0.0","-p","443", "--environment", "production" ]

#from here on we're working on app specific stuff
COPY web /web
RUN bundle install
