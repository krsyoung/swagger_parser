# SwaggerParser
[Swagger](http://swagger.io/) schema parser.

## Usage
```rb
require "swagger_parser"

swagger = SwaggerParser::FileParser.parse("examples/swagger.yml")
swagger.base_path #=> "/v2"
swagger.host #=> "petstore.swagger.io"

swagger = SwaggerParser::IOParser.parse("{}", :json)
swagger.base_path #=> "/v2"
swagger.host #=> "petstore.swagger.io"

```
