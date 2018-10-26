# coding: utf-8

# 解析ipip.net库， city_find:查找ip的城市, district_find: 查找ip的区县
module DatxRuby
  require "socket"
  require "ipaddr"
  require "datx_ruby/version"
  require "datx_ruby/util"
  require "datx_ruby/common"
  require "datx_ruby/district"
  require "datx_ruby/city"

  def self.city_datx_path=(path)
    City.datax_path= path
  end

  def self.district_datx_path=(path)
    District.datax_path= path
  end

  def self.city_find(ip)
    City.new.find(ip)
  end

  def self.district_find(ip)
    District.new.find(ip)
  end

end

DXR = DatxRuby


if $0==__FILE__
  DXR.city_datx_path= "/home/limx/myfiles/github/datx-ruby/lib/data/17monipdb.datx"
  puts DXR.city_find("106.75.109.221")
  # puts DatxRuby.find_by_address "http://taobao.com"
end