#
# Cookbook Name:: thalassa
# Recipe:: haproxy
#
# Copyright (C) 2013 Friedel Ziegelmayer
#



#
# Create the thalassa user and group that thalassa will run as.
#

group node[:haproxy][:group]
user node[:haproxy][:user] do
  gid node[:haproxy][:group]
end

#
# Install haproxy
#
include_recipe 'haproxy'
