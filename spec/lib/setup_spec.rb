require 'spec_helper'

describe Setup do
  subject(:setup) { described_class.new(hash) }

  let(:hash) { load_yaml_fixture_file('setup.yml') }

  describe '#applications' do
    it "returns an array of Setup::Applications" do
      expect(subject.applications).to be_a(Array)
      expect(subject.applications.first).to be_a(Setup::Application)
    end

    it "returns all configured applications" do
      expect(subject.applications.map(&:name)).to eq(%w[
        my-application
        my-inactive-application
      ])
    end
  end

  describe '#active_applications' do
    it 'returns only the active applications' do
      expect(subject.active_applications.map(&:name)).to eq(%w[
        my-application
      ])
    end
  end
end
