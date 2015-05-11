directory '/home/vagrant/.ssh' do
  action :create
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file '/home/vagrant/.ssh/insecure_private_key' do
  action :create
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
  source 'insecure_private_key'
end

cookbook_file '/home/vagrant/.ssh/authorized_keys' do
  action :create
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
  source 'insecure_public_key'
end