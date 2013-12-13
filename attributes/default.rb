#
# Thalassa
#
default[:thalassa][:user] = 'thalassa'
default[:thalassa][:group] = default[:thalassa][:user]
default[:thalassa][:install_dir] = '/opt/thalassa'


#
# Thalassa Server
#

# host to bind to
default[:thalassa_server][:host] = '127.0.0.1'
# port to bind to for axon socket
default[:thalassa_server][:port] = 5001
# host to bind to
default[:thalassa_server][:apiHost] = '127.0.0.1'
# port to bind to for http api
default[:thalassa_server][:apiPort] = 9000
# Redis host
default[:thalassa_server][:redisHost] = '127.0.0.1'
# Redis port
default[:thalassa_server][:redisPort] = 6379
# Redis database to select
default[:thalassa_server][:redisDatabase] = 0
# Reaper frequency (ms)
default[:thalassa_server][:reaperFreq] = 2000
# enabled debug logging
default[:thalassa_server][:debug] = false

#
# Thalassa Crowsnest
#
# host to bind to
default[:thalassa_crowsnest][:host] = default[:thalassa][:host]
# port to bind to
default[:thalassa_crowsnest][:port] = default[:thalassa][:port]
# host of the Thalassa server
default[:thalassa_crowsnest][:thalassaHost] = default[:thalassa_server][:host]
# port of the Thalassa server
default[:thalassa_crowsnest][:thalassaPort] = default[:thalassa_server][:port]
# port of the Thalassa server
default[:thalassa_crowsnest][:thalassaApiPort] = default[:thalassa_server][:apiPort]
# filesystem path for leveldb
default[:thalassa_crowsnest][:dbPath] = './node_modules/thalassa-crowsnest/bin/db'
# enabled debug logging
default[:thalassa_crowsnest][:thalassaApiPort] = default[:thalassa][:debug]

#
# Thalassa Aqueduct
#

# host to bind to
default[:thalassa_aqueduct][:host] = '127.0.0.1'
# port to bind to
default[:thalassa_aqueduct][:port] = 10000
# logical label for this aqueduct
default[:thalassa_aqueduct][:label] = 'aqueduct1'
# host of the Thalassa server
default[:thalassa_aqueduct][:thalassaHost] = '127.0.0.1'
# socket port of the Thalassa server
default[:thalassa_aqueduct][:thalassaPort] = 5001
# http API port of the Thalassa server
default[:thalassa_aqueduct][:thalassaApiPort] = 9000
# path to Haproxy socket file
default[:thalassa_aqueduct][:haproxySocketPath] = '/tmp/haproxy.status.sock'
# path to  Haproxy pid file
default[:thalassa_aqueduct][:haproxyPidPath] = '/var/run/haproxy.pid'
# generated Haproxy config location
default[:thalassa_aqueduct][:haproxyCfgPath] = '/etc/haproxy/haproxy.cfg'
# template used to generate haproxy config
default[:thalassa_aqueduct][:templateFile] = 'default.haproxycfg.tmpl'
# directory to save configuration
default[:thalassa_aqueduct][:persistence] = "#{default[:thalassa][:install_dir]}"
# use sudo when starting haprox
default[:thalassa_aqueduct][:sudo] = false
# enabled debug logging
default[:thalassa_aqueduct][:debug] = false

#
# haproxy
#
default[:haproxy][:enable_default_http] = false
default[:haproxy][:listeners] = {
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
default[:haproxy][:enable_stats_socket] = false
default[:haproxy][:stats_socket_path] = '/var/run/haproxy.sock'
default[:haproxy][:stats_socket_user] = node[:haproxy][:user]
default[:haproxy][:stats_socket_group] = node[:haproxy][:group]

#
# NodeJS
#
default[:nodejs][:install_method] = 'package'
default[:nodejs][:version] = '0.10.23'


