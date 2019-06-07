require 'spec_helper'

describe Config do
  describe '.instance' do
    it do
      expect(described_class.instance).to be_a(described_class)
    end

    context 'when calling twice' do
      it 'returns the same instance' do
        expect(described_class.instance)
          .to be(described_class.instance)
      end
    end

    context 'after reset' do
      before { described_class.reset }

      it do
        expect(described_class.instance).to be_a(described_class)
      end
    end
  end

  describe '.reset' do
    let(:old_instance) { described_class.instance }

    it 'resets instance' do
      expect { described_class.reset }
        .to change { described_class.instance.eql?(old_instance) }
        .from(true).to(false)
    end

    it 'forces regeneration of instance' do
      expect { described_class.reset }
        .not_to change { described_class.instance.class }
    end
  end

  describe '.configure' do
  end
end
