require 'spec_helper'
require 'securerandom'

describe LolClient do
  subject { described_class.new(api_key, region) }

  let(:api_key) { ENV['API_KEY'] || SecureRandom.hex }
  let(:region) { :na }

  describe '#region' do
    its(:region) { should eq region }
  end

  describe '#inspect' do
    it 'does include the region' do
      expect(subject.inspect).to include region.inspect
    end

    it 'does not include the api_key' do
      expect(subject.inspect).to_not include api_key
    end
  end

  describe '#champions' do
    let(:champions) { VCR.use_cassette('champions') { subject.champions } }

    it 'returns an array' do
      expect(champions).to be_an Array
    end

    it 'contains champions' do
      expect(champions.map(&:class).uniq).to eq [LolClient::Champion]
    end

    it 'matches the response data' do
      expected_champion = LolClient::Champion.new(
          id: 266,
          name: 'Aatrox',
          active: true,
          attack_rank: 8,
          defense_rank: 4,
          magic_rank: 3,
          difficulty_rank: 6,
          bot_enabled: false,
          free_to_play: true,
          bot_mm_enabled: false,
          ranked_play_enabled: true,
      )

      expect(champions.first).to eq expected_champion
    end
  end

  describe '#recent_games' do
    let(:recent_games) { VCR.use_cassette('recent_games') { subject.recent_games(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns an array' do
      expect(recent_games).to be_an Array
    end

    it 'contains games' do
      expect(recent_games.map(&:class).uniq).to eq [LolClient::Game]
    end

    it 'matches the response data' do
      most_recent_game = recent_games.first

      expect(recent_games.size).to eq 10
      expect(most_recent_game.id).to eq 1275139681
      expect(most_recent_game.mode).to eq 'CLASSIC'
      expect(most_recent_game.type).to eq 'MATCHED_GAME'
      expect(most_recent_game.sub_type).to eq 'RANKED_SOLO_5x5'
      expect(most_recent_game.team_id).to eq 200
      expect(most_recent_game.created_at).to eq 1392436670767
      expect(most_recent_game.invalid).to be_false
      expect(most_recent_game.level).to eq 30
      expect(most_recent_game.map_id).to eq 1
      expect(most_recent_game.champion_id).to eq 86
      expect(most_recent_game.spell1).to eq 4
      expect(most_recent_game.spell2).to eq 12
      expect(most_recent_game.raw_stats).to be_a LolClient::RawStats
      expect(most_recent_game.fellow_players).to be_an Array
      expect(most_recent_game.fellow_players.map(&:class).uniq).to eq [LolClient::Player]
    end
  end

  describe '#challenger_league' do
    let(:challenger_league) { VCR.use_cassette('challenger_league') { subject.challenger_league(type) } }
    let(:type) { :RANKED_SOLO_5x5 }

    it 'returns a league' do
      expect(challenger_league).to be_a LolClient::League
    end

    it 'matches the response data' do
      expected_league_entry = LolClient::LeagueEntry.new(
          fresh_blood: true,
          hot_streak: true,
          inactive: false,
          last_played: -1,
          name: "Taric's Enforcers",
          player_or_team_id: '29530546',
          player_or_team_name: 'CloudTidus',
          points: 30,
          queue_type: 'RANKED_SOLO_5x5',
          rank: 'I',
          tier: 'CHALLENGER',
          veteran: false,
          wins: 58,
      )

      expect(challenger_league.name).to eq "Taric's Enforcers"
      expect(challenger_league.queue).to eq 'RANKED_SOLO_5x5'
      expect(challenger_league.tier).to eq 'CHALLENGER'
      expect(challenger_league.entries.size).to eq 200
      expect(challenger_league.entries.first).to eq expected_league_entry
    end
  end
end
