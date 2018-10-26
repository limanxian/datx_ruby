# coding: utf-8
module DatxRuby

  class City

    include DatxRuby::Common

    def initialize
      @data = IO.binread(datx)
      @index_size = Util.bytes2long(@data[0], @data[1], @data[2], @data[3])
    end

    def self.datax_path=(path)
      $datx_path ||= path
    end

    def find(ip)
      raise "Invalid IP address" unless ::IPAddr.new(ip).ipv4?
      low = 0
      high = (index_size - 262144 - 262148) / 9 - 1
      val = Util.ip2long(ip)
      while low <= high do
        mid = (low + high) / 2
        pos = mid * 9 + 262148
        starts = 0
        mid_new = mid - 1
        if mid > 0
          pos_new = mid_new * 9 + 262148
          starts = Util.bytes2long(@data[pos_new], @data[pos_new + 1], @data[pos_new + 2], @data[pos_new + 3])
          starts += 1
        end
        ends = Util.bytes2long(@data[pos], @data[pos + 1], @data[pos + 2], @data[pos + 3])
        if val < starts
          high = mid_new
        elsif val > ends
          low = mid + 1
        else
          empty = [0].pack('C*')
          off = Util.bytes2long(empty, @data[pos + 6], @data[pos + 5], @data[pos + 4])
          length = Util.bytes2long(empty, empty, @data[pos + 7], @data[pos + 8])
          pos = off - 262144 + index_size
          tmp = @data[pos...pos + length].force_encoding('utf-8')
          return tmp.split("\t")
        end
      end

    end

  end

end
