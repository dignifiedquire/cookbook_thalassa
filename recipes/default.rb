#
# Cookbook Name:: thalassa
# Recipe:: default
#
# Copyright (C) 2013 Friedel Ziegelmayer
#


#
# Create the thalassa user and group that thalassa will run as.
#

group node[:thalassa][:group]
user node[:thalassa][:user] do
  gid node[:thalassa][:group]
  shell '/bin/bash'
  system true
end

group 'sudo' do
  action :modify
  members node[:thalassa][:user]
  append true
end


#
# Install Node
#
include_recipe 'nodejs'

#
# Create app directory
#
directory node[:thalassa][:install_dir] do
  recursive true
  owner node[:thalassa][:user]
  group node[:thalassa][:group]
end

#
# Install and setup
#
include_recipe 'redis::install_from_package'
include_recipe 'thalassa::git'
include_recipe 'thalassa::server'
include_recipe 'thalassa::crowsnest'
include_recipe 'thalassa::aqueduct'
