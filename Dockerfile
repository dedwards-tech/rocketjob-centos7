# Baseline dev tools based on centos 7 w/ ruby and various gems pre-installed

FROM centos:latest
ENV container docker

WORKDIR /root

COPY Gemfile ./
RUN touch Gemfile.lock

# download, build and install ruby
COPY install-ruby.sh ./
RUN chmod +x install-ruby.sh && sleep 1
RUN ./install-ruby.sh

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm  && yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip

# cleanup
RUN yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]
