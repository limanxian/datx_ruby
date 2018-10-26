module DatxRuby

  # 工具
  class Util

    # class method
    class << self
      def ip2long(ip)
        ::IPAddr.new(ip).to_i
      end

      def bytes2long(four, three, two, one)
        four = check_code(four, 24)
        three = check_code(three, 16)
        two = check_code(two, 8)
        one = check_code(one, 0)
        four | three | two | one
      end

      def check_code(content, num)
        content.unpack("C*")[0] << num
      end

    end
  end
end