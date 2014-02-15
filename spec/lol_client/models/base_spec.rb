require 'spec_helper'

describe LolClient::ModelBase do
  subject { test_class.new }

  before { test_class.attributes *attributes, boolean: is_boolean }

  let(:test_class) { Class.new(described_class) }
  let(:attributes) { [:foo, :bar] }
  let(:is_boolean) { false }

  describe '.attributes' do
    describe 'when :boolean is false' do
      let(:is_boolean) { false }

      it 'creates getters' do
        expect(subject).to respond_to :foo
        expect(subject).to respond_to :bar
      end

      it 'creates setters' do
        expect(subject).to respond_to :foo=
        expect(subject).to respond_to :bar=
      end

      it 'does not create boolean getters' do
        expect(subject).to_not respond_to :foo?
        expect(subject).to_not respond_to :bar?
      end
    end

    describe 'when :boolean is true' do
      let(:is_boolean) { true }

      it 'creates getters' do
        expect(subject).to respond_to :foo
        expect(subject).to respond_to :bar
      end

      it 'creates setters' do
        expect(subject).to respond_to :foo=
        expect(subject).to respond_to :bar=
      end

      it 'creates boolean getters' do
        expect(subject).to respond_to :foo?
        expect(subject).to respond_to :bar?
      end
    end
  end

  describe '#==' do
    before do
      subject.foo = 'foo'
      subject.bar = 'bar'
    end

    it 'returns true when the classes and all attributes match' do
      expect(subject).to eq test_class.new(foo: 'foo', bar: 'bar')
    end

    it "returns false when the classes match any any of the attributes don't match" do
      expect(subject).to_not eq test_class.new(foo: 'foo', bar: 'foo')
      expect(subject).to_not eq test_class.new(foo: 'bar', bar: 'bar')
      expect(subject).to_not eq test_class.new(foo: 'bar', bar: 'foo')
    end

    it "return false when the classes don't match" do
      require 'ostruct'
      expect(subject).to_not eq OpenStruct.new(foo: 'foo', bar: 'bar')
    end
  end
end
