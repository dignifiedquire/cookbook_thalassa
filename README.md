# thalassa cookbook

Install [thalassa] and all requirements including [haproxy].

# Requirements

# Usage

# Attributes

# Recipes

# Development

To use with Vagrant:

Make sure ruby, bundler, vagrant and berkshelf are installed on your machine. Then

```bash
$ vagrant plugin install vagrant-berkshelf
$ bundle install
$ berks install
$ vagrant up
```

# Todo

* Add redis
* Make haproxy work including stats
* Setup sample client
* Document attributes
* Document recipes

# Author

Friedel Ziegelmayer <dignifiedquire@gmail.com>

[thalassa]: https://github.com/PearsonEducation/thalassa
[haproxy]: http://haproxy.1wt.eu/
