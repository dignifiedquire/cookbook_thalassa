#
# Cookbook Name:: thalassa
# Recipe:: haproxy
#
# Copyright (C) 2013 Friedel Ziegelmayer
#
# All rights reserved - Do Not Redistribute
#


# install haproxy
include_recipe 'haproxy'

haproxy_lb 'incoming' do
  type 'frontend'
  bind '*:80'
  params({
    'acl' => 'thalassa-crowsnest path /nest'
  })
end

haproxy_lb 'thalassa-crowsnest' do
  type 'backend'
  servers ['crowsnest 127.0.0.1:8080']
end
