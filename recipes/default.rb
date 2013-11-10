#
# Cookbook Name:: thalassa
# Recipe:: default
#
# Copyright (C) 2013 Friedel Ziegelmayer
#
# All rights reserved - Do Not Redistribute
#

# Create the thalassa user and group that thalassa will run as.
#

group node[:thalassa][:group]

user node[:thalassa][:user] do
  gid node[:thalassa][:group]
  supports :manage_home => true
  home "/home/#{node[:thalassa][:user]}"
  shell '/bin/bash'
  action :create
end


# install nvm
include_recipe 'nvm'


# install node.js v0.10.21
nvm_install 'v0.10.21'  do
  from_source false
  alias_as_default true
  action :create
end

# Create app directory
directory node[:thalassa][:install_dir] do
  recursive true
  owner node[:thalassa][:user]
  group node[:thalassa][:group]
end

# Install and setup
include_recipe 'thalassa::crowsnest'

include_recipe 'thalassa::haproxy'
