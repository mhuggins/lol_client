FactoryGirl.define do
  factory :player, class: LolClient::Player do
    sequence(:champion_id) { |n| n + 1_000 }
    sequence(:summoner_id) { |n| n + 10_000 }
    sequence(:team_id)     { |n| n + 100_000 }
  end
end
