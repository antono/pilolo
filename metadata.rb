name             'pilolo'
maintainer       'Antono Vasiljev'
maintainer_email 'self@antono.info'
license          'GPLv3'
description      'Installs/Configures pilolo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w[hostname ntp postfix dovecot].each { |cb| depends cb }
