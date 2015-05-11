#
# Cookbook Name:: chef-provisioning-node
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'build-essential'
include_recipe 'git'

chef_dk 'my_chef_dk' do
    version 'latest'
    global_shell_init true
    action :install
end

chef_gem 'knife-push'

