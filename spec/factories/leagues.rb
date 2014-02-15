FactoryGirl.define do
  factory :league, class: LolClient::League do
    entries { build_list :league_entry, 2 }
    name { Faker::Business.name }
    sequence(:participant_id) { |n| n + 1_000 }
    queue { %w[RANKED_SOLO_5x5 RANKED_TEAM_3x3 RANKED_TEAM_5x5].sample }
    tier { %w[CHALLENGER DIAMOND PLATINUM GOLD SILVER BRONZE].sample }
  end
end
