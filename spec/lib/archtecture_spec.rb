require 'spec_helper'

describe Archtecture do
  subject(:config) do
    described_class.new(config_hash, active_applications)
  end

  let(:active_applications) { %w[my_application] }

  let(:config_hash) do
    {
      'my_application' => {
        'containers' => %w[api worker]
      }
    }
  end

  describe '#applications' do
    let(:expected_config) do
      Archtecture::Application.new(
        'my_application', 'containers' => %w[api worker]
      )
    end

    it do
      expect(config.applications).to all(be_a(Archtecture::Application))
    end

    it 'returns one element for each active application' do
      expect(config.applications.map(&:name)).to eq(active_applications)
    end

    it 'includes config application from configured applications' do
      expect(config.applications.first)
        .to eq(expected_config)
    end

    context 'when a configuration and settup are not matches' do
      let(:active_applications) { %w[my_app] }
      let(:expected_config) do
        Archtecture::Application.new(
          'my_app', nil
        )
      end

      it 'returns one element for each active application' do
        expect(config.applications.map(&:name)).to eq(active_applications)
      end

      it 'includes base config application' do
        expect(config.applications.first)
          .to eq(expected_config)
      end
    end
  end
end
