# haproxy
default['haproxy']['enable_default_http'] = false
default['haproxy']['listeners'] = {
  'frontend' => {
    'crowsnest' => [
      'bind *:80',
      'mode http',
      'option forwardfor',
      'option httpclose',
      'default_backend crowsnest'
    ]
  },
  'backend' => {
    'crowsnest' => [
      'stats enable',
      'stats hide-version',
      'stats realm Haproxy\ Statistics',
      'stats uri /haproxy?stats',
      'stats auth friedel:secret',
      'server crowsnest01 127.0.0.1:8080 check'
    ]
  }
}
default['haproxy']['enable_stats_socket'] = false
default['haproxy']['stats_socket_path'] = "/var/run/haproxy.sock"
default['haproxy']['stats_socket_user'] = node['haproxy']['user']
default['haproxy']['stats_socket_group'] = node['haproxy']['group']


# npm

default['npm']['version'] = '1.3.11'


# Thalass Crowsnest
default[:thalassa][:user] = 'thalassa'
default[:thalassa][:group] = default[:thalassa][:user]
default[:thalassa][:install_dir] = '/var/www/thalassa'
