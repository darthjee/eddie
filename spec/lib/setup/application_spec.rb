require 'spec_helper'

describe Setup::Application do
  subject(:application) { described_class.new(name, hash) }

  let(:hash) { load_yaml_fixture_file('setup/application.yml') }
  let(:name) { 'my-application' }

  describe '#name' do
    it 'returns the name' do
      expect(subject.name).to eq(name)
    end
  end

  describe '#active' do
    it 'returns the value set in the hash' do
      expect(subject.active).to be_truthy
    end

    context "when hash is empty" do
      let(:hash) { {} }

      it 'returns false' do
        expect(subject.active).to eq(false)
      end
    end
  end

  describe '#local' do
    it 'returns the value set in the hash' do
      expect(subject.local).to eq(false)
    end

    context "when hash is empty" do
      let(:hash) { {} }

      it 'returns false' do
        expect(subject.local).to eq(false)
      end
    end
  end
end
