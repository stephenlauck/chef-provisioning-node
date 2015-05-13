name             'chef-provisioning-node'
maintainer       'The Authors'
maintainer_email 'you@example.com'
license          'all_rights'
description      'Installs/Configures chef-provisioning-node'
long_description 'Installs/Configures chef-provisioning-node'
version          '0.1.1'

%w(apt build-essential git packagecloud chef-dk).each do |cb|
  depends cb
end
