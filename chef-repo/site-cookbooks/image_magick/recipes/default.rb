#
# Cookbook Name:: image_magick
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

package "ImageMagick" do
        action :upgrade
        version "6.5.4.7"
end

package "ImageMagick-devel" do
        action :upgrade
        version "6.5.4.7"
end

package "ipa-pgothic-fonts" do
        action :upgrade
        version "003.02"
end
