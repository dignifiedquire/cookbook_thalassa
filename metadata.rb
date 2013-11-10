name             'thalassa'
maintainer       'Friedel Ziegelmayer'
maintainer_email 'dignifiedquire@gmail.com'
license          'All rights reserved'
description      'Installs and configuresthalassa'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'haproxy'
depends 'nvm'
depends 'npm'
depends 'sudo'

recipe 'thalassa::default',   'Combination of all recipes.'
recipe 'thalassa::crowsnest', 'Install the frontend of thalassa, thalassa-crowsnest.'
recipe 'thalassa::haproxy', 'Install haproxy setup for use with thalassa.'


