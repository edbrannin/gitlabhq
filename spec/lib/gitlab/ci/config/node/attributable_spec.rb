require 'spec_helper'

describe Gitlab::Ci::Config::Node::Attributable do
  let(:node) { Class.new }
  let(:instance) { node.new }

  before do
    node.include(described_class)

    node.class_eval do
      attributes :name, :test
    end
  end

  context 'config is a hash' do
    before do
      allow(instance)
        .to receive(:config)
        .and_return({ name: 'some name', test: 'some test' })
    end

    it 'returns the value of config' do
      expect(instance.name).to eq 'some name'
      expect(instance.test).to eq 'some test'
    end

    it 'returns no method error for unknown attributes' do
      expect { instance.unknown }.to raise_error(NoMethodError)
    end
  end

  context 'config is not a hash' do
    before do
      allow(instance)
        .to receive(:config)
        .and_return('some test')
    end

    it 'returns nil' do
      expect(instance.test).to be_nil
    end
  end
end
