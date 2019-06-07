require 'spec_helper'

describe Archtecture::Container do
  subject(:container) do
    described_class.new(type, application)
  end

  let(:application) { Archtecture::Application.new('my-app', {}) }

  shared_examples 'a container requiring containers' do |db: true, redis: false|
    it 'responds properly to require_db' do
      expect(container.require_db?).to eq(db)
    end

    it 'responds properly to require_redis' do
      expect(container.require_redis?).to eq(redis)
    end
  end

  describe '#require_' do
    context 'when type is api' do
      let(:type) { 'api' }

      it_behaves_like 'a container requiring containers'
    end

    context 'when type is worker' do
      let(:type) { 'worker' }

      it_behaves_like 'a container requiring containers', {
        redis: true
      }
    end

    context 'when type is redis' do
      let(:type) { 'redis' }

      it_behaves_like 'a container requiring containers', {
        db: false
      }
    end
  end
end
