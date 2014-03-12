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

    it 'returns an array of champions' do
      expect(champions).to be_an_array_of LolClient::Champion
    end

    it 'matches the response data' do
      expect(champions).to have(117).items

      champion = champions.first

      expect(champion.id).to eq 266
      expect(champion.name).to eq 'Aatrox'
      expect(champion.active).to be_true
      expect(champion.attack_rank).to eq 8
      expect(champion.defense_rank).to eq 4
      expect(champion.magic_rank).to eq 3
      expect(champion.difficulty_rank).to eq 6
      expect(champion.bot_enabled).to be_false
      expect(champion.free_to_play).to be_true
      expect(champion.bot_mm_enabled).to be_false
      expect(champion.ranked_play_enabled).to be_true
    end
  end

  describe '#recent_games' do
    let(:recent_games) { VCR.use_cassette('recent_games') { subject.recent_games(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns an array of games' do
      expect(recent_games).to be_an_array_of LolClient::Game
    end

    it 'matches the response data' do
      expect(recent_games).to have(10).items

      most_recent_game = recent_games.first

      expect(most_recent_game.id).to eq 1275139681
      expect(most_recent_game.mode).to eq 'CLASSIC'
      expect(most_recent_game.type).to eq 'MATCHED_GAME'
      expect(most_recent_game.sub_type).to eq 'RANKED_SOLO_5x5'
      expect(most_recent_game.team_id).to eq 200
      expect(most_recent_game.created_at).to eq Time.new(2014, 2, 15, 3, 57, 50, 0)
      expect(most_recent_game.invalid).to be_false
      expect(most_recent_game.level).to eq 30
      expect(most_recent_game.map_id).to eq 1
      expect(most_recent_game.champion_id).to eq 86
      expect(most_recent_game.spell1).to eq 4
      expect(most_recent_game.spell2).to eq 12
      expect(most_recent_game.raw_stats).to be_a LolClient::RawStats
      expect(most_recent_game.fellow_players).to be_an_array_of LolClient::Player
    end
  end

  describe '#challenger_league' do
    let(:league) { VCR.use_cassette('challenger_league') { subject.challenger_league(type) } }
    let(:type) { :RANKED_SOLO_5x5 }

    it 'returns a league' do
      expect(league).to be_a LolClient::League
    end

    it 'matches the response data' do
      expect(league.name).to eq "Taric's Enforcers"
      expect(league.queue).to eq 'RANKED_SOLO_5x5'
      expect(league.tier).to eq 'CHALLENGER'

      entries = league.entries

      expect(entries).to be_an_array_of LolClient::LeagueEntry
      expect(entries).to have(200).items
    end
  end

  describe '#league_entries' do
    let(:league_entries) { VCR.use_cassette('league_entries') { subject.league_entries(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns an array of league entries' do
      expect(league_entries).to be_an_array_of LolClient::LeagueEntry
    end

    it 'matches the response data' do
      league_entry = league_entries.first
      expect(league_entry.last_played).to eq -1
      expect(league_entry.name).to eq "Riven's Fists"
      expect(league_entry.points).to eq 45
      expect(league_entry.mini_series).to be_nil
      expect(league_entry.player_or_team_id).to eq '45444628'
      expect(league_entry.player_or_team_name).to eq 'Finklebaum'
      expect(league_entry.queue_type).to eq 'RANKED_SOLO_5x5'
      expect(league_entry.rank).to eq 'III'
      expect(league_entry.tier).to eq 'BRONZE'
      expect(league_entry.wins).to eq 39
      expect(league_entry.fresh_blood).to be_false
      expect(league_entry.hot_streak).to be_false
      expect(league_entry.inactive).to be_false
      expect(league_entry.veteran).to be_false
    end
  end

  describe '#leagues' do
    let(:leagues) { VCR.use_cassette('leagues') { subject.leagues(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns an array of leagues' do
      expect(leagues).to be_an_array_of LolClient::League
    end

    it 'matches the response data' do
      expect(leagues).to have(1).item

      league = leagues.first

      expect(league.name).to eq "Riven's Fists"
      expect(league.participant_id).to eq '45444628'
      expect(league.queue).to eq 'RANKED_SOLO_5x5'
      expect(league.tier).to eq 'BRONZE'

      expect(league.entries).to be_an_array_of LolClient::LeagueEntry
      expect(league.entries).to have(200).items
    end
  end

  describe '#summoners' do
    let(:summoners) { VCR.use_cassette('summoners') { subject.summoners(summoner_ids) } }
    let(:summoner_ids) { %w[45444628 49411514] }

    it 'returns a hash of summoners' do
      expect(summoners).to be_a_hash_of LolClient::Summoner
    end

    it 'matches the response data' do
      expect(summoners).to have(2).items
      expect(summoners.keys.sort).to eq summoner_ids.sort

      summoner = summoners['45444628']

      expect(summoner.id).to eq 45444628
      expect(summoner.level).to eq 30
      expect(summoner.name).to eq 'Finklebaum'
      expect(summoner.profile_icon_id).to eq 6
      expect(summoner.revised_at).to eq Time.at(1392472370)
    end
  end

  describe '#summoner' do
    let(:summoner) { VCR.use_cassette('summoner') { subject.summoner(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns a summoner' do
      expect(summoner).to be_a LolClient::Summoner
    end

    it 'matches the response data' do
      expect(summoner.id).to eq 45444628
      expect(summoner.level).to eq 30
      expect(summoner.name).to eq 'Finklebaum'
      expect(summoner.profile_icon_id).to eq 6
      expect(summoner.revised_at).to eq Time.at(1392472370)
    end
  end

  describe '#summoners_by_name' do
    let(:summoners) { VCR.use_cassette('summoners_by_name') { subject.summoners_by_name(summoner_names) } }
    let(:summoner_names) { %w[Finklebaum fartmouth] }

    it 'returns a hash of summoners' do
      expect(summoners).to be_a_hash_of LolClient::Summoner
    end

    it 'matches the response data' do
      expect(summoners).to have(2).items
      expect(summoners.keys.sort).to eq summoner_names.map(&:downcase).sort

      summoner = summoners['finklebaum']

      expect(summoner.id).to eq 45444628
      expect(summoner.level).to eq 30
      expect(summoner.name).to eq 'Finklebaum'
      expect(summoner.profile_icon_id).to eq 6
      expect(summoner.revised_at).to eq Time.at(1392472370)
    end
  end

  describe '#summoner_by_name' do
    let(:summoner) { VCR.use_cassette('summoner_by_name') { subject.summoner_by_name(summoner_name) } }
    let(:summoner_name) { 'Finklebaum' }

    it 'returns a summoner' do
      expect(summoner).to be_a LolClient::Summoner
    end

    it 'matches the response data' do
      expect(summoner.id).to eq 45444628
      expect(summoner.level).to eq 30
      expect(summoner.name).to eq 'Finklebaum'
      expect(summoner.profile_icon_id).to eq 6
      expect(summoner.revised_at).to eq Time.at(1392472370)
    end
  end

  describe '#summoner_names' do
    let(:summoner_names) { VCR.use_cassette('summoner_names') { subject.summoner_names(summoner_ids) } }
    let(:summoner_ids) { [45444628, 49411514] }

    it 'returns a hash of strings' do
      expect(summoner_names).to be_a_hash_of String
    end

    it 'matches the response data' do
      expect(summoner_names).to have(2).items
      expect(summoner_names['45444628']).to eq 'Finklebaum'
      expect(summoner_names['49411514']).to eq 'fartmouth'
    end
  end

  describe '#summoner_name' do
    let(:summoner_name) { VCR.use_cassette('summoner_name') { subject.summoner_name(summoner_id) } }
    let(:summoner_id) { 45444628 }

    it 'returns a string' do
      expect(summoner_name).to be_a String
    end

    it 'matches the response data' do
      expect(summoner_name).to eq 'Finklebaum'
    end
  end

  describe '#static_champions' do
    let(:champions) { VCR.use_cassette('static_champions') { subject.static_champions(champ_data: 'all') } }

    it 'returns a hash of champions' do
      expect(champions).to be_a_hash_of LolClient::Static::Champion
    end

    it 'matches the response data' do
      expect(champions).to have(118).items
    end

    it_behaves_like 'a static champion' do
      let(:champion) { champions['Annie'] }
    end
  end

  describe '#static_champion' do
    let(:champion) { VCR.use_cassette('static_champion') { subject.static_champion(champion_id, champ_data: 'all') } }
    let(:champion_id) { 1 }

    it_behaves_like 'a static champion'
  end

  describe '#static_items' do
    let(:items) { VCR.use_cassette('static_items') { subject.static_items(item_data: 'all') } }

    it 'returns a hash of items' do
      expect(items).to be_a_hash_of LolClient::Static::Item
    end

    it 'matches the response data' do
      expect(items).to have(216).items
    end

    it_behaves_like 'a static item' do
      let(:item) { items['2009'] }
    end
  end

  describe '#static_item' do
    let(:item) { VCR.use_cassette('static_item') { subject.static_item(item_id, item_data: 'all') } }
    let(:item_id) { 2009 }

    it_behaves_like 'a static item'
  end

  describe '#static_masteries' do
    let(:masteries) { VCR.use_cassette('static_masteries') { subject.static_masteries(mastery_data: 'all') } }

    it 'returns a hash of masteries' do
      expect(masteries).to be_a_hash_of LolClient::Static::Mastery
    end

    it 'matches the response data' do
      expect(masteries).to have(57).items
    end

    it_behaves_like 'a static mastery' do
      let(:mastery) { masteries['4353'] }
    end
  end

  describe '#static_mastery' do
    let(:mastery) { VCR.use_cassette('static_mastery') { subject.static_mastery(mastery_id, mastery_data: 'all') } }
    let(:mastery_id) { 4353 }

    it_behaves_like 'a static mastery'
  end

  describe '#static_runes' do
    let(:runes) { VCR.use_cassette('static_runes') { subject.static_runes(rune_data: 'all') } }

    it 'returns a hash of runes' do
      expect(runes).to be_a_hash_of LolClient::Static::Rune
    end

    it 'matches the response data' do
      expect(runes).to have(296).items
    end

    it_behaves_like 'a static rune' do
      let(:rune) { runes['5235'] }
    end
  end

  describe '#static_rune' do
    let(:rune) { VCR.use_cassette('static_rune') { subject.static_rune(rune_id, rune_data: 'all') } }
    let(:rune_id) { 5235 }

    it_behaves_like 'a static rune'
  end

  describe '#static_spells' do
    let(:spells) { VCR.use_cassette('static_spells') { subject.static_spells(spell_data: 'all') } }

    it 'returns a hash of spells' do
      expect(spells).to be_a_hash_of LolClient::Static::SummonerSpell
    end

    it 'matches the response data' do
      expect(spells).to have(13).items
    end

    it_behaves_like 'a static summoner spell' do
      let(:spell) { spells['SummonerBarrier'] }
    end
  end

  describe '#static_spell' do
    let(:spell) { VCR.use_cassette('static_spell') { subject.static_spell(spell_id, spell_data: 'all') } }
    let(:spell_id) { 'SummonerBarrier' }

    it_behaves_like 'a static summoner spell'
  end
end
