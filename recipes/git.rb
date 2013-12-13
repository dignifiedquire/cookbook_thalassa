#
# Cookbook Name:: thalassa
# Recipe:: git
#
# Copyright (C) 2013 Friedel Ziegelmayer
#


#
# Install latest git
#

apt_repository 'git-core' do
  uri          'http://ppa.launchpad.net/git-core/ppa/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  deb_src      true
  keyserver    'keyserver.ubuntu.com'
  key          'E1DD270288B4E6030699E45FA1715D88E1DF1F24'
end

include_recipe 'git'
