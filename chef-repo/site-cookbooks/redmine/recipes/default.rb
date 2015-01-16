#
# Cookbook Name:: redmine
# Recipe:: default
#
# Copyright 2015, REDMINE
#
# All rights reserved - Do Not Redistribute
#

## Install OpenSSL-devel

package 'openssl-devel' do
	action :upgrade
	version "1.0.1"
end

package 'readline' do
	action :upgrade
	version "6.0.4"
end

package 'zlib-devel' do
	action :upgrade
	version "1.2.3"
end

package 'curl-devel' do
	action :upgrade
	version "7.19.7"
end

package 'libyaml-devel' do
	action :upgrade
	version "0.1.3"
end

gem_package 'bundler' do
	action :upgrade
	version "1.7.12"
end
