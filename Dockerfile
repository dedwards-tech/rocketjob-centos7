# Baseline dev tools based on centos 7 w/ ruby and various gems pre-installed

FROM centos:latest
ENV container docker

WORKDIR /root

COPY Gemfile ./
COPY Gemfile.lock ./
COPY mongodb-org.repo /etc/yum.repos.d/

# download, build and install ruby
COPY install-ruby.sh ./
RUN chmod +x install-ruby.sh && ./install-ruby.sh

# install mongodb
RUN yum install -y mongodb-org

# cleanup
RUN yum clean all && rm -rf /var/cache/yum
