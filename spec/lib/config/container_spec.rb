require 'spec_helper'

describe Config::Container do
  subject(:container) do
    described_class.new(type, application)
  end

  let(:type) { 'api' }
  let(:application) { Application.new() }

  xit 'add test here'
end
