require 'spec_helper'

describe Application do
  subject(:application) do
    described_class.new(name, container_types)
  end

  let(:name)            { 'my_application' }
  let(:container_types) { %w[api worker db redis] }

  let(:expected_names) do
    %w[
      my_application-api
      my_application-worker
      my_application-db
      my_application-redis
    ]
  end

  describe '#containers' do
    it do
      expect(application.containers).to all(be_a(Container))
    end

    it 'returns containers for all given types' do
      expect(application.containers.map(&:type))
        .to eq(container_types)
    end

    it 'returns containers with correct names' do
      expect(application.containers.map(&:name))
        .to eq(expected_names)
    end
  end
end
