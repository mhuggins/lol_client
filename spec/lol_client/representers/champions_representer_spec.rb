require 'spec_helper'

describe LolClient::ChampionsRepresenter do
  subject { described_class.new(champions) }

  let(:champions) { [] }

  describe '#from_json' do
    before { subject.from_json(load_json_fixture('champions')) }

    it 'returns an array' do
      expect(champions).to be_an Array
    end

    it 'contains champions' do
      expect(champions.map(&:class).uniq).to eq [LolClient::Champion]
    end

    it 'contains the correct number of champions' do
      expect(champions.size).to eq 116
    end
  end
end
