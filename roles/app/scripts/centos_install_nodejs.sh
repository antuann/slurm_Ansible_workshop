#!/bin/bash
nodejs=$( rpm -qa|grep nodejs )
if [ "$nodejs" == "" ]; then
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
fi
