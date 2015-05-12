git "/home/vagrant/delivery-cluster" do
  repository "https://github.com/stephenlauck/delivery-cluster.git"
  revision 'ssh_delivery_berks'
  checkout_branch 'ssh_delivery_berks'
  user 'vagrant'
  group 'vagrant'
  action :sync
end

directory '/home/vagrant/delivery-cluster/environments' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  recursive true
  action :create
end

template '/home/vagrant/delivery-cluster/environments/test.json' do
  source 'test.json.erb'
  owner 'vagrant'
  group 'vagrant'
end
