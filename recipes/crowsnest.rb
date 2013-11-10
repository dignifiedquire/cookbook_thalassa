#
# Cookbook Name:: thalassa
# Recipe:: crowsnest
#
# Copyright (C) 2013 Friedel Ziegelmayer
#
# All rights reserved - Do Not Redistribute
#


include_recipe "npm"

npm_package "thalassa-crowsnest" do
  action :install_local
  path node[:thalassa][:install_dir]
end

npm_package "thalassa" do
  action :install_local
  path node[:thalassa][:install_dir]
end

#
# Allow the thalassa user to start/stop thalassa-crowsnest via Upstart.
#
sudo "#{node[:thalassa][:user]}-upstart" do
  user node[:thalassa][:user]
  commands ['/sbin/start thalassa-crowsnest', '/sbin/stop thalassa-crowsnest',
    '/sbin/restart thalassa-crowsnest', '/sbin/status thalassa-crowsnest']
  nopasswd true
end

#
# Install Upstart script
#
service 'thalassa-crowsnest' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
end

template 'thalassa-crowsnest.upstart.conf' do
  path '/etc/init/thalassa-crowsnest.conf'
  source 'thalassa-crowsnest.upstart.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thalassa-crowsnest]'
end

service 'thalassa-crowsnest' do
  action [ :enable, :start ]
end
