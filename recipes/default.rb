#
# Cookbook Name:: chef-provisioning-node
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packagecloud_repo 'chef/current' do
    type value_for_platform_family(debian: 'deb', rhel: 'rpm')
end

case node['platform_family']
when 'debian'
	include_recipe 'apt'
end

%w(build-essential git).each do |ir|
  include_recipe ir
end

chef_dk 'my_chef_dk' do
    version 'latest'
    global_shell_init true
    action :install
end

chef_gem 'knife-push'
