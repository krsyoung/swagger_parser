require "json"
require "swagger_parser/errors/io_parsing_error"
require "swagger_parser/swagger"
require "yaml"

module SwaggerParser
  class IOParser
    YAML_EXTNAMES = %w(.yaml .yml)

    class << self
      # @param [String] path
      # @return [SwaggerParser::Swagger]
      def parse(io, format = :yaml)
        new(io, format).parse
      end
    end

    # @param [String] path
    def initialize(io, format)
      raise SwaggerParser::Errors::IOParsingError, "format must be :json or :yaml" unless [:json, :yaml].include? format
      @io = io
      @format = format
    end

    # @return [SwaggerParser::Swagger]
    # @raise [SwaggerParser::Errors::FileParsingError]
    def parse
      SwaggerParser::Swagger.new(parse_io)
    end

    private

    # @return [String]
    def content
      # File.read(@io)
      @io.read
    end

    # @return [Object]
    # @raise [SwaggerParser::Errors::FileParsingError]
    def parse_io
      if yaml?
        YAML.load(content)
      else
        JSON.parse(content)
      end
    rescue => exception
      raise SwaggerParser::Errors::IOParsingError, exception
    end

    # # @return [String]
    # def format
    #   @format
    # end

    # @return [false, true]
    def yaml?
      @format == :yaml
    end
  end
end
