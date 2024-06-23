#!/bin/bash
cd  /opt/xpaste_practicum/bin
export PATH="/opt/rbenv/bin:$PATH"
export RBENV_ROOT="/opt/rbenv"
eval "$(rbenv init -)"
export version_ruby=$1
echo "ruby ver: $version_ruby"
export install_ruby=$( rbenv versions | grep $version_ruby )
export current_ruby= $( rbenv global |grep $version_ruby )
echo "ruby install: $install_ruby"
echo "ruby current: $current_ruby"


if [ "${install_ruby}" == "" ]; then
 rbenv install $version_ruby
fi 

if [ "${current_ruby}" == "" ]; then 
 rbenv global $version_ruby
fi

cd  /opt/xpaste_practicum
gem install bundler -v '1.16.2'  --source 'https://rubygems.org/'
gem install nokogiri -v '1.8.2' --source 'https://rubygems.org/'
gem install pg -v '0.21.0' --source 'https://rubygems.org/'
gem install execjs

cd  /opt/xpaste_practicum/bin
./bundle config build.nokogiri --use-system-libraris
./bundle install --clean --no-cache --without development
