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

package 'chefdk' do
  action :upgrade
end

chef_gem 'knife-push'
