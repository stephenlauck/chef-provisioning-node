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

execute 'create ssh keys for github' do
  command <<-EOF
    ssh-keygen -t rsa -N '' -b 2048 -f /home/vagrant/.ssh/github_key
  EOF
  user 'vagrant'
  group 'vagrant'
  not_if do ::File.exists?('/home/vagrant/.ssh/github_key') end
end

file "/home/vagrant/.ssh/config" do 
  content <<-EOD
Host 33.33.33.*
    IdentityFile /home/vagrant/.ssh/insecure_private_key
    StrictHostKeyChecking no

Host github
    HostName github.com
    User git
    IdentityFile /home/vagrant/.ssh/github_key
    StrictHostKeyChecking no
  EOD
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
end