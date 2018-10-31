# coding: utf-8

# 解析ipip.net库， city_find:查找ip的城市, district_find: 查找ip的区县
module DatxRuby
  require "ipaddr"
  require "datx_ruby/version"
  require "datx_ruby/util"
  require "datx_ruby/common"
  require "datx_ruby/district"
  require "datx_ruby/city"

  # set city datx file path
  # Example:
  #   >> DatxRuby.city_datx_path= "/path/data/17monipdb.datx"
  #   => /path/data/17monipdb.datx
  # Arguments:
  #   path: (String)
  def self.city_datx_path=(path)
    City.datax_path= path
  end

  # set district datx file path
  # Example:
  #   >> DatxRuby.district_datx_path= "/path/data/17monipdb.datx"
  #   => /path/data/17monipdb.datx
  # Arguments:
  #   path: (String)
  def self.district_datx_path=(path)
    District.datax_path= path
  end

  # find a ip's location
  # Example:
  #   >> DatxRuby.city_find("106.75.109.221")
  #   => ["中国", "北京", "北京"]
  # Arguments:
  #   ip: (String)
  def self.city_find(ip)
    City.new.find(ip)
  end

  # find a ip's district
  # Example:
  #   >> DatxRuby.district_find("106.75.109.221")
  #   => ["中国", "北京", "北京"]
  # Arguments:
  #   ip: (String)
  def self.district_find(ip)
    District.new.find(ip)
  end

end
