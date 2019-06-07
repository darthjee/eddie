require 'spec_helper'

describe Container do
  describe '.from' do
    subject(:container) do
      described_class.from(type, application)
    end

    let(:type)        { 'db' }
    let(:application) { 'my-application' }

    it do
      expect(container).to be_a(described_class)
    end

    it 'initializes correct name' do
      expect(container.name).to eq('my-application-db')
    end
  end
end
