#
# Cookbook Name:: chef-provisioning-node
# Recipe:: aws
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
	include_recipe 'apt'
end

package 'awscli'

chef_gem 'knife-ec2'
