# coding: utf-8
require 'spec_helper'

describe DatxRuby do

  describe "# query test" do
    before :all do
      @path = "/home/limx/myfiles/github/datx_ruby/lib/data/17monipdb.datx"
      DatxRuby.city_datx_path = @path
    end

    it "path is setted" do
      expect(DatxRuby::City.new.datx_path).to eq(@path)
    end

    it "can find location by city" do
      result = DatxRuby.city_find("106.75.109.221")
      expect(result).to eq(["中国", "北京", "北京"])
    end

    it "can find location by district" do

    end
  end
end