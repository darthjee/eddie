require 'spec_helper'

describe Archtecture::Application do
  subject(:application) do
    described_class.new(name, hash)
  end

  let(:name) { 'my-application' }
  let(:containers) { %w[api worker] }
  let(:hash) do
    { 'containers' => containers }
  end

  describe '#build' do
    let(:containers_expected) { %w[api worker db redis] }

    it 'returns a full application' do
      expect(subject.build).to be_a(::Application)
    end

    it 'completes the containers' do
      expect(subject.build.container_types)
        .to eq(containers_expected)
    end

    context 'when there is no worker' do
      let(:containers) { %w[api] }
      let(:containers_expected) { %w[api db] }

      it 'completes the containers without redis' do
        expect(subject.build.container_types)
          .to eq(containers_expected)
      end
    end
  end
end

