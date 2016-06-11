RSpec.describe SwaggerParser::IOParser do
  describe ".parse" do
    subject do
      described_class.parse(io, format)
    end

    let(:example_swagger_yaml) do
      File.read("examples/swagger.yml")
    end

    let(:example_swagger_json) do
      File.read("examples/swagger.json")
    end

    let(:io) do
      fail NotImplementedError
    end

    context "with invalid format" do
      let(:io) do
        StringIO.new
      end
      let(:format) do
        :blah
      end

      xit { is_expected.to raise_exception(SwaggerParser::Errors::IOParsingError) }
    end

    context "with invalid YAML" do
      let(:io) do
        StringIO.new("{woop}")
      end

      let(:format) do
        :yaml
      end

      xit { is_expected.to raise_exception(SwaggerParser::Errors::IOParsingError) }
    end

    context "with valid YAML" do
      let(:io) do
        StringIO.new(example_swagger_yaml)
      end

      let(:format) do
        :yaml
      end

      it { is_expected.to be_a SwaggerParser::Swagger }
    end

    context "with invalid JSON" do
      let(:io) do
        StringIO.new("woop")
      end

      let(:format) do
        :json
      end

      xit { is_expected.to raise_exception(SwaggerParser::Errors::IOParsingError) }
    end

    context "with valid JSON" do
      let(:io) do
        StringIO.new(example_swagger_json)
      end

      let(:format) do
        :json
      end

      it { is_expected.to be_a SwaggerParser::Swagger }
    end
  end
end
