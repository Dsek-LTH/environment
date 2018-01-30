name 'dsek-website'
maintainer 'Nils Ceberg'
maintainer_email 'nils.ceberg@gmail.com	'
license 'ISC'
description 'Installs and configures the dsek website'
long_description 'Installs and configures the dsek website'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'nodejs', '~> 5.0.0'
