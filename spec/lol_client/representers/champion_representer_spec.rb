require 'spec_helper'

describe LolClient::ChampionRepresenter do
  subject { described_class.new(champion) }

  let(:champion) { LolClient::Champion.new }

  describe '#from_json' do
    before { subject.from_json(load_json_fixture('champion')) }

    it 'sets champion id' do
      expect(champion.id).to eq 266
    end

    it 'sets champion name' do
      expect(champion.name).to eq 'Aatrox'
    end

    it 'sets champion attack rank' do
      expect(champion.attack_rank).to eq 8
    end

    it 'sets champion defense rank' do
      expect(champion.defense_rank).to eq 4
    end

    it 'sets champion difficulty rank' do
      expect(champion.difficulty_rank).to eq 6
    end

    it 'sets champion magic rank' do
      expect(champion.magic_rank).to eq 3
    end

    it 'sets bot enabled flag' do
      expect(champion).to_not be_bot_enabled
    end

    it 'sets bot mm enabled flag' do
      expect(champion).to_not be_bot_mm_enabled
    end

    it 'sets free to play flag' do
      expect(champion).to be_free_to_play
    end

    it 'sets ranked play enabled flag' do
      expect(champion).to be_ranked_play_enabled
    end
  end
end
