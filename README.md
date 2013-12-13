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

See `attributes/default.rb` for all available options.

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

## Todo

* haproxy
  * template for thalassa-aqueduct
  * secure thalassa-crowsnest interface using simple auth
* use attributes for service definitions of
  * thalassa-server
  * thalassa-aqueduct
  * thalassa-crowsnest


## Author

Friedel Ziegelmayer <dignifiedquire@gmail.com>

[thalassa]: https://github.com/PearsonEducation/thalassa
[haproxy]: http://haproxy.1wt.eu/
