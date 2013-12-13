#
# Cookbook Name:: thalassa
# Recipe:: aqueduct
#
# Copyright (C) 2013 Friedel Ziegelmayer
#


#
# Install haproxy
#
include_recipe 'thalassa::haproxy'

#
# Install thalassa-aqueduct
#
npm_package 'thalassa-aqueduct' do
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
  commands ['/sbin/start thalassa-aqueduct', '/sbin/stop thalassa-aqueduct',
    '/sbin/restart thalassa-aqueduct', '/sbin/status thalassa-aqueduct']
  nopasswd true
end


#
# Copy haproxy template
#
template 'thalassa.haproxycfg.tmpl.erb' do
  path "#{node[:thalassa][:install_dir]}/#{node[:thalassa_aqueduct][:template_file]}"
  source 'thalassa.haproxycfg.tmpl.erb'
  owner 'thalassa'
  group 'thalassa'
end


#
# Install Upstart script
#
service 'thalassa-aqueduct' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
end

template 'thalassa-aqueduct.upstart.conf' do
  path '/etc/init/thalassa-aqueduct.conf'
  source 'thalassa-aqueduct.upstart.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thalassa-aqueduct]'
end

service 'thalassa-aqueduct' do
  action [ :enable, :start ]
end
