# thalassa cookbook

Install [thalassa] and all requirements including [haproxy].


## Usage

Just `include_recipe 'thalassa'` and you're good to go. For more see recipes
and configuration.


## Recipes

### thalassa::default
### thalassa::server
### thalassa::aqueduct
### thalassa::crowsnest

## Configuration

The following variables are used to configure the setup.

### `haproxy`
* `user = 'haproxy'`
* `group = 'haproxy'`
* `enable_default_http = false`
* `listeners`
* `enable_stats_socket = false`
* `stats_socket_path = "/var/run/haproxy.sock"`
* `stats_socket_user = node['haproxy']['user']`
* `stats_socket_group = node['haproxy']['group']`


### `nodejs`

* `install_method = 'package'`
* `version = '0.10.23'`


### `thalassa`
* `user = 'thalassa'`
* `group = default[:thalassa][:user]`
* `install_dir = '/opt/thalassa'`


## Development

This cookbook uses [Test Kitchen](http://kitchen.ci/), [Foodcritic](http://acrmp.github.io/foodcritic/)
together with Guard and Vagrant for continuous testing.

```bash
$ bundle install
$ be guard
```

### With Vagrant

Install the Chef Zero Vagrant plugin and run Vagrant:

```bash
$ vagrant plugin install vagrant-chef-zero
$ vagrant up
```


# Author

Friedel Ziegelmayer <dignifiedquire@gmail.com>

[thalassa]: https://github.com/PearsonEducation/thalassa
[haproxy]: http://haproxy.1wt.eu/
