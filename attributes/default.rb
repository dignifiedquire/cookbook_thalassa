# haproxy
default['haproxy']['members'] = []
default['haproxy']['enable_stats_socket'] = true
default['haproxy']['stats_socket_path'] = "/var/run/haproxy.sock"
default['haproxy']['stats_socket_user'] = node['haproxy']['user']
default['haproxy']['stats_socket_group'] = node['haproxy']['group']


# npm

default['npm']['version'] = '1.3.11'


# Thalass Crowsnest
default[:thalassa][:user] = 'thalassa'
default[:thalassa][:group] = default[:thalassa][:user]
default[:thalassa][:install_dir] = '/var/www/thalassa'
