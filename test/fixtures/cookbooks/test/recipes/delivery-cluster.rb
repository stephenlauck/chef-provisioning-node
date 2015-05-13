packagecloud_repo 'chef/current' do
    type value_for_platform_family(debian: 'deb', rhel: 'rpm')
end

case node['platform_family']
when 'debian'
  package 'delivery-cli' do
    action :upgrade
  end
when 'rhel'
  execute 'installing-delivery-cli' do
    command <<-EOF
      curl -o delivery-cli.rpm https://s3.amazonaws.com/delivery-packages/cli/delivery-cli-20150408004719-1.x86_64.rpm
      sudo yum install delivery-cli.rpm -y
    EOF
    not_if('which delivery')
  end
end

# clone delivery-cluster cookbook to provisiong node
git "/home/vagrant/delivery-cluster" do
  repository "https://github.com/opscode-cookbooks/delivery-cluster.git"
  revision 'master'
  user 'vagrant'
  group 'vagrant'
  action :sync
end

# create environments directory
directory '/home/vagrant/delivery-cluster/environments' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  recursive true
  action :create
end

# create environment for delivery-cluster build
template '/home/vagrant/delivery-cluster/environments/test.json' do
  source 'test.json.erb'
  owner 'vagrant'
  group 'vagrant'
end
