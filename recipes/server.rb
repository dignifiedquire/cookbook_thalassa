#
# Cookbook Name:: thalassa
# Recipe:: server
#
# Copyright (C) 2013 Friedel Ziegelmayer
#
# All rights reserved - Do Not Redistribute
#

#
# Install thalassa npm package
#
npm_package 'thalassa' do
  action :install_local
  path node[:thalassa][:install_dir]
end

user = node[:thalassa][:user]
group = node[:thalassa][:group]

#
# Chown directory to the right user after npm install
#
execute 'chown' do
  command "sudo chown -R #{user}:#{group} #{node[:thalassa][:install_dir]}"
end


#
# Allow the thalassa user to start/stop thalassa via Upstart.
#
sudo "#{user}-upstart" do
  user user
  commands ['/sbin/start thalassa', '/sbin/stop thalassa',
    '/sbin/restart thalassa', '/sbin/status thalassa']
  nopasswd true
end

#
# Install Upstart script
#
service 'thalassa' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
end

template 'thalassa.upstart.conf' do
  path '/etc/init/thalassa.conf'
  source 'thalassa.upstart.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thalassa]'
end

service 'thalassa' do
  action [ :enable, :start ]
end
