case node['platform_family']
when 'debian'
  execute 'installing-delivery-cli' do
    command <<-EOF
      curl https://packagecloud.io/install/repositories/chef/current/script.deb | sudo bash
      sudo apt-get install delivery-cli
    EOF
    not_if('which delivery')
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
