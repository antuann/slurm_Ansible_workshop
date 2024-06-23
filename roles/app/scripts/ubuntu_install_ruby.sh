#!/bin/sh
#PATH="/opt//bin:$PATH"
#eval "$(rbenv init -)"
version_ruby=$1
echo "ruby ver: $version_ruby"
install_ruby=$( rbenv versions | grep $version_ruby )
current_ruby= $( rbenv global |grep $version_ruby )
echo "ruby install: $install_ruby"
echo "ruby current: $current_ruby"


#if [ -z "${install_ruby}" ]; then
# rbenv install $version_ruby
#fi 

#if [ -z "${current_ruby}" ]; then 
# rbenv global $version_ruby
#fi

gem install bundler -v '1.16.2'  --source 'https://rubygems.org/'
gem install nokogiri -v '1.8.2' --source 'https://rubygems.org/'
gem install pg -v '0.21.0' --source 'https://rubygems.org/'

bundle config build.nokogiri --use-system-libraris
bundle install --clean --no-cache --without development

