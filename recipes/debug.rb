#
# Cookbook Name:: pilolo
# Recipe:: debug
#
# Copyright (C) 2013 Antono Vasiljev
# 
node.debug.packages.each do |pkg|
  package pkg
end
