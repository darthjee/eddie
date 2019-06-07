require "yaml"

module FixtureHelpers
  def load_fixture_file(filename)
    FixtureHelpers.fixture_file_cache["#{filename}"] ||=
      File.open("spec/fixtures/#{filename}").read
  end

  def load_yaml_fixture_file(filename)
    FixtureHelpers.yaml_fixture_file_cache["#{filename}"] ||=
      YAML.parse(load_fixture_file(filename)).to_ruby
  end

  def self.fixture_file_cache
    @fixture_file_cache ||= {}
  end

  def self.yaml_fixture_file_cache
    @yaml_fixture_file_cache ||= {}
  end
end

RSpec.configuration.include FixtureHelpers
