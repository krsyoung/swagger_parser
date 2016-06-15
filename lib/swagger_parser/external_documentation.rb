require "swagger_parser/source_based_object"

module SwaggerParser
  class ExternalDocumentation < SourceBasedObject
    # @return [Object]
    def url
      source["url"]
    end

    # @return [Object]
    def description
      source["description"]
    end
  end
end
