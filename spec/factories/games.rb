FactoryGirl.define do
  factory :game, class: LolClient::Game do
    sequence(:id)
    mode { %w[CLASSIC ODIN ARAM TUTORIAL ONEFORALL FIRSTBLOOD].sample }
    type { %w[CUSTOM_GAME MATCHED_GAME TUTORIAL_GAME].sample }
    sub_type { %w[NONE NORMAL BOT RANKED_SOLO_5x5 RANKED_PREMADE_3x3 RANKED_PREMADE_5x5 ODIN_UNRANKED RANKED_TEAM_3x3 RANKED_TEAM_5x5 NORMAL_3x3 BOT_3x3 ARAM_UNRANKED_5x5 ONEFORALL_5x5 FIRSTBLOOD_1x1 FIRSTBLOOD_2x2].sample }
    sequence(:team_id)
    created_at { Time.now.to_i }
    fellow_players { build_list :player, 4 }
    invalid false
    level { (1..10).to_a.sample }
    sequence(:map_id) { |n| n + 1_000 }
    sequence(:champion_id) { |n| n + 10_000 }
    spell1 { (1..10).to_a.sample }
    spell2 { (1..10).to_a.sample }
    raw_stats { build :raw_stats }
  end
end
