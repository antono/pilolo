#
# Cookbook Name:: pilolo
# Recipe:: default
#
# Copyright (C) 2013 Antono Vasiljev
# 

include_recipe 'hostname'
include_recipe 'ntp'

#
# Setup main user and ssh access...
#
require 'pathname'

home = Pathname.new('/home/').join(node.user.name)

user node.user.name do
  username node.user.name
  home home.to_s
  shell "/bin/bash"
end

directory home.to_s do
  owner node.user.name
  group node.user.name
  mode '700'
  action :create
end

directory home.join('.ssh').to_s do
  owner node.user.name
  group node.user.name
  mode '700'
  action :create
end

file home.join('.ssh/authorized_keys').to_s do
  owner node.user.name
  group node.user.name
  mode '700'
  content node.user.public_key
  action :create
end


#
# Setup zeroconf for easy intranet access via 'pilolo.local'
#
if node[:mdns]
  %w(avahi-daemon avahi-discover libnss-mdns).each { |p| package p }
end
