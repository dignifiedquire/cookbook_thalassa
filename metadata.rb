name             'thalassa'
maintainer       'Friedel Ziegelmayer'
maintainer_email 'dignifiedquire@gmail.com'
license          'All rights reserved'
description      'Installs and configures thalassa.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends 'haproxy'
depends 'nodejs'
depends 'npm'
depends 'sudo'

recipe 'thalassa::default',   'Combination of all recipes.'
recipe 'thalassa::server', 'Install the thalassa server.'
recipe 'thalassa::crowsnest', 'Install the frontend of thalassa, thalassa-crowsnest.'
recipe 'thalassa::aqueduct', 'Install thalassa-aqueduct, the dynamic haproxy configurator.'
recipe 'thalassa::haproxy', 'Install haproxy setup for use with thalassa.'

