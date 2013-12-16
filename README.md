# thalassa cookbook

Install [thalassa] and all requirements including [haproxy].


## Usage

Just `include_recipe 'thalassa'` and you're good to go. For more see recipes
and configuration.


## Recipes

### thalassa::default
Combine all recipes below and setup the installation directory and a thalassa user/group.

### thalassa::server
Install and setup [thalassa-server].

### thalassa::aqueduct
Install and setup [thalassa-aqueduct].

### thalassa::crowsnest
Install and setup [thalassa-crowsnest].

### thalassa::git
Install the latest version of git from this [ppa].

### thalassa::haproxy
Install [haproxy].

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
  * expose haproxy stats page
* lwrp for
  * frontends
  * backends

## Author

Friedel Ziegelmayer <dignifiedquire@gmail.com>

[thalassa]: https://github.com/PearsonEducation/thalassa
[haproxy]: http://haproxy.1wt.eu/

## License

MIT License

[haproxy]: http://haproxy.1wt.eu/
[thalassa]: https://github.com/PearsonEducation/thalassa
[thalassa-server]: https://github.com/PearsonEducation/thalassa
[thalassa-crowsnest]: https://github.com/PearsonEducation/thalassa-crowsnest
[thalassa-aqueduct]: https://github.com/PearsonEducation/thalassa-aqueduct
[ppa]: http://ppa.launchpad.net/git-core/ppa/ubuntu
