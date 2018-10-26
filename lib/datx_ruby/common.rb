module DatxRuby
  module Common

    def datx_path(path = (File.expand_path '../../data/17monipdb.datx', __FILE__))
      $datx_path ||= path
    end

    def datx
      @datx ||= File.open datx_path, 'rb'
    end

    def index_size
      @index_size
    end
  end
end