#
# Cookbook Name:: image_magick
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Install Image Magick

package "ImageMagick" do
        action :upgrade
        version "6.5.4.7"
end


## Install ImageMagick-devel

package "ImageMagick-devel" do
        action :upgrade
        version "6.5.4.7"
end


## Install ipa-pgothic-fonts

package "ipa-pgothic-fonts" do
        action :upgrade
        version "003.02"
end
