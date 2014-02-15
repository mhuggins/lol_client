require 'lol_client/models/base'

class LolClient
  class RawStats < ModelBase
    attributes :assists, :barracks_killed, :champions_killed, :combat_player_score, :consumables_purchased,
               :damage_dealt_player, :double_kills, :first_blood, :gold, :gold_earned, :gold_spent, :item0,
               :item1, :item2, :item3, :item4, :item5, :item6, :items_purchased, :killing_sprees,
               :largest_critical_strike, :largest_killing_spree, :largest_multi_kill,
               :legendary_items_created, :level, :magic_damage_dealt_player, :magic_damage_dealt_to_champions,
               :magic_damage_taken, :minions_denied, :minions_killed, :neutral_minions_killed,
               :neutral_minions_killed_enemy_jungle, :neutral_minions_killed_your_jungle,
               :node_capture, :node_capture_assist, :node_neutralize, :node_neutralize_assist,
               :num_deaths, :num_items_bought, :objective_player_score, :penta_kills, :physical_damage_dealt_player,
               :physical_damage_dealt_to_champions, :physical_damage_taken, :quadra_kills, :sight_wards_bought,
               :spell1_cast, :spell2_cast, :spell3_cast, :spell4_cast, :summon_spell1_cast, :summon_spell2_cast,
               :super_monster_killed, :team, :team_objective, :time_played, :total_damage_dealt,
               :total_damage_dealt_to_champions, :total_damage_taken, :total_heal, :total_player_score,
               :total_score_rank, :total_time_crowd_control_dealt, :total_units_healed, :triple_kills,
               :true_damage_dealt_player, :true_damage_dealt_to_champions, :true_damage_taken, :turrets_killed,
               :unreal_kills, :victory_point_total, :vision_wards_bought, :ward_killed, :ward_placed
    attributes :nexus_killed, :win, boolean: true
  end
end
