# Baseline dev tools based on centos 7 w/ ruby and various gems pre-installed

FROM centos:latest
ENV container docker

WORKDIR /root

COPY Gemfile ./
COPY Gemfile.lock ./

# download, build and install ruby
COPY install-ruby.sh ./
RUN chmod +x install-ruby.sh && sleep 1
RUN ./install-ruby.sh

# install mongodb
#COPY mongodb-org.repo /etc/yum.repos.d/
#COPY install-mongodb.sh ./
#RUN chmod +x install-mongodb.sh && sleep 1
#RUN ./install-mongodb.sh

# cleanup
RUN yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]
