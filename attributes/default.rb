#
# Thalassa
#
default[:thalassa][:user] = 'thalassa'
default[:thalassa][:group] = node[:thalassa][:user]
default[:thalassa][:install_dir] = '/opt/thalassa'
default[:thalassa][:debug] = false

#
# Thalassa Server
#

# host to bind to
default[:thalassa_server][:host] = '127.0.0.1'
# port to bind to for axon socket
default[:thalassa_server][:port] = 5001
# host to bind to
default[:thalassa_server][:api_host] = '127.0.0.1'
# port to bind to for http api
default[:thalassa_server][:api_port] = 9000
# Redis host
default[:thalassa_server][:redis_host] = '127.0.0.1'
# Redis port
default[:thalassa_server][:redis_port] = 6379
# Redis database to select
default[:thalassa_server][:redis_database] = 0
# Reaper frequency (ms)
default[:thalassa_server][:reaper_freq] = 2000
# enabled debug logging
default[:thalassa_server][:debug] = node[:thalassa][:debug]

#
# Thalassa Crowsnest
#
# host to bind to
default[:thalassa_crowsnest][:host] = '0.0.0.0'
# port to bind to
default[:thalassa_crowsnest][:port] = 8080
# host of the Thalassa server
default[:thalassa_crowsnest][:thalassa_host] = node[:thalassa_server][:host]
# port of the Thalassa server
default[:thalassa_crowsnest][:thalassa_port] = node[:thalassa_server][:port]
# port of the Thalassa server
default[:thalassa_crowsnest][:thalassa_api_port] = node[:thalassa_server][:api_port]
# filesystem path for leveldb
default[:thalassa_crowsnest][:db_path] = './node_modules/thalassa-crowsnest/bin/db'
# enabled debug logging
default[:thalassa_crowsnest][:debug] = node[:thalassa][:debug]

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
default[:thalassa_aqueduct][:thalassa_host] = '127.0.0.1'
# socket port of the Thalassa server
default[:thalassa_aqueduct][:thalassa_port] = 5001
# http API port of the Thalassa server
default[:thalassa_aqueduct][:thalassa_api_port] = 9000
# path to Haproxy socket file
default[:thalassa_aqueduct][:haproxy_socket_path] = node[:haproxy][:stats_socket_path]
# path to  Haproxy pid file
default[:thalassa_aqueduct][:haproxy_pid_path] = node[:haproxy][:pid_file]
# generated Haproxy config location
default[:thalassa_aqueduct][:haproxy_cfg_path] = '/opt/thalassa/haproxy.cfg'
# template used to generate haproxy config
default[:thalassa_aqueduct][:template_file] = 'default.haproxycfg.tmpl'
# directory to save configuration
default[:thalassa_aqueduct][:persistence] = "#{default[:thalassa][:install_dir]}/tmp.js"
# use sudo when starting haprox
default[:thalassa_aqueduct][:sudo] = false
# enabled debug logging
default[:thalassa_aqueduct][:debug] = node[:thalassa][:debug]

# Login for stats
default[:thalassa_aqueduct][:stats_user] = 'user'
default[:thalassa_aqueduct][:stats_password] = 'pass'

# Login for crowsnest
default[:thalassa_aqueduct][:user] = 'admin'
default[:thalassa_aqueduct][:password] = 'pass'

#
# haproxy
#
default[:haproxy][:user] = 'haproxy'
default[:haproxy][:group] = node[:haproxy][:user]
default[:haproxy][:enable_default_http] = false
default[:haproxy][:enable_stats_socket] = true
default[:haproxy][:stats_socket_path] = '/var/run/haproxy.sock'
default[:haproxy][:stats_socket_user] = node[:haproxy][:user]
default[:haproxy][:stats_socket_group] = node[:haproxy][:group]

#
# NodeJS
#
default[:nodejs][:install_method] = 'package'
default[:nodejs][:version] = '0.10.23'

#
# Redis
#
default[:redis][:install] = true

