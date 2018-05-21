#!/bin/bash

yum -y update
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

# Download and Build rbenv

cd 
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# install ruby 2.4.4 release version and make it global
rbenv install 2.4.4 ; rbenv global 2.4.4 ; rbenv versions ; ruby -v

# Install gems from Gemfile
gem install bundler
bundle install
