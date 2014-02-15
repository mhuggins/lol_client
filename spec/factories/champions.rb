FactoryGirl.define do
  factory :champion, class: LolClient::Champion do
    sequence(:id)
    name { Faker::Internet.user_name }
    attack_rank { (1..10).to_a.sample }
    defense_rank { (1..10).to_a.sample }
    difficulty_rank { (1..10).to_a.sample }
    magic_rank { (1..10).to_a.sample }
    active { [true, false].sample }
    bot_enabled { [true, false].sample }
    bot_mm_enabled { [true, false].sample }
    free_to_play { [true, false].sample }
    ranked_play_enabled { [true, false].sample }
  end
end
