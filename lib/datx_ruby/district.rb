module DatxRuby

  class District

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
      high = (index_size - 262148 - 262144) / 13 - 1
      val = Util.ip2long(ip)

      while low <= high do
        mid = (low + high) / 2
        pos = mid * 13 + 262148

        starts = Util.bytes2long(@data[pos], @data[pos + 1], @data[pos + 2], @data[pos + 3])
        ends = Util.bytes2long(@data[pos+4], @data[pos + 5], @data[pos + 6], @data[pos + 7])

        if val > ends
          low = mid + 1
        elsif val < starts
          high = mid - 1
        else
          off = Util.bytes2long(@data[pos + 11], @data[pos + 10], @data[pos + 9], @data[pos + 8])
          l = @data[pos + 12].to_i
          pos = off - 262144 + index_size

          tmp = @data[pos...pos + l].force_encoding('utf-8')
          return tmp.split("\t")
        end
      end

    end

  end

end
