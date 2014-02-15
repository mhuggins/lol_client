FactoryGirl.define do
  factory :league_entry, class: LolClient::LeagueEntry do
    fresh_blood { [true, false].sample }
    hot_streak { [true, false].sample }
    inactive { [true, false].sample }
    last_played { Time.now.to_i }
    name { Faker::Name.name }
    points { (1..100).to_a.sample }
    mini_series { build :league_mini_series }
    sequence(:player_or_team_id) { |n| n + 1_000 }
    player_or_team_name { Faker::Name.name }
    queue_type { Faker::Lorem.word }
    rank { %w[I II III IV V].sample }
    tier { %w[CHALLENGER DIAMOND PLATINUM GOLD SILVER BRONZE].sample }
    wins { (1..100).to_a.sample }
    veteran { [true, false].sample }
  end
end
