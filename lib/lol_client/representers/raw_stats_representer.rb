require 'representable/json'

class LolClient
  class RawStatsRepresenter < Representable::Decorator
    include Representable::JSON

    property :assists
    property :barracks_killed, as: :barracksKilled
    property :champions_killed, as: :championsKilled
    property :combat_player_score, as: :combatPlayerScore
    property :consumables_purchased, as: :consumablesPurchased
    property :damage_dealt_player, as: :damageDealtPlayer
    property :double_kills, as: :doubleKills
    property :first_blood, as: :firstBlood
    property :gold
    property :gold_earned, as: :goldEarned
    property :gold_spent, as: :goldSpent
    property :item0
    property :item1
    property :item2
    property :item3
    property :item4
    property :item5
    property :item6
    property :items_purchased, as: :itemsPurchased
    property :killing_sprees, as: :killingSprees
    property :largest_critical_strike, as: :largestCriticalStrike
    property :largest_killing_spree, as: :largestKillingSpree
    property :largest_multi_kill, as: :largestMultiKill
    property :legendary_items_created, as: :legendaryItemsCreated
    property :level
    property :magic_damage_dealt_player, as: :magicDamageDealtPlayer
    property :magic_damage_dealt_to_champions, as: :magicDamageDealtToChampions
    property :magic_damage_taken, as: :magicDamageTaken
    property :minions_denied, as: :minionsDenied
    property :minions_killed, as: :minionsKilled
    property :neutral_minions_killed, as: :neutralMinionsKilled
    property :neutral_minions_killed_enemy_jungle, as: :neutralMinionsKilledEnemyJungle
    property :neutral_minions_killed_your_jungle, as: :neutralMinionsKilledYourJungle
    property :nexus_killed, as: :nexusKilled
    property :node_capture, as: :nodeCapture
    property :node_capture_assist, as: :nodeCaptureAssist
    property :node_neutralize, as: :nodeNeutralize
    property :node_neutralize_assist, as: :nodeNeutralizeAssist
    property :num_deaths, as: :numDeaths
    property :num_items_bought, as: :numItemsBought
    property :objective_player_score, as: :objectivePlayerScore
    property :penta_kills, as: :pentaKills
    property :physical_damage_dealt_player, as: :physicalDamageDealtPlayer
    property :physical_damage_dealt_to_champions, as: :physicalDamageDealtToChampions
    property :physical_damage_taken, as: :physicalDamageTaken
    property :quadra_kills, as: :quadraKills
    property :sight_wards_bought, as: :sightWardsBought
    property :spell1_cast, as: :spell1Cast
    property :spell2_cast, as: :spell2Cast
    property :spell3_cast, as: :spell3Cast
    property :spell4_cast, as: :spell4Cast
    property :summon_spell1_cast, as: :summonSpell1Cast
    property :summon_spell2_cast, as: :summonSpell2Cast
    property :super_monster_killed, as: :superMonsterKilled
    property :team
    property :team_objective, as: :teamObjective
    property :time_played, as: :timePlayed
    property :total_damage_dealt, as: :totalDamageDealt
    property :total_damage_dealt_to_champions, as: :totalDamageDealtToChampions
    property :total_damage_taken, as: :totalDamageTaken
    property :total_heal, as: :totalHeal
    property :total_player_score, as: :totalPlayerScore
    property :total_score_rank, as: :totalScoreRank
    property :total_time_crowd_control_dealt, as: :totalTimeCrowdControlDealt
    property :total_units_healed, as: :totalUnitsHealed
    property :triple_kills, as: :tripleKills
    property :true_damage_dealt_player, as: :trueDamageDealtPlayer
    property :true_damage_dealt_to_champions, as: :trueDamageDealtToChampions
    property :true_damage_taken, as: :trueDamageTaken
    property :turrets_killed, as: :turretsKilled
    property :unreal_kills, as: :unrealKills
    property :victory_point_total, as: :victoryPointTotal
    property :vision_wards_bought, as: :visionWardsBought
    property :ward_killed, as: :wardKilled
    property :ward_placed, as: :wardPlaced
    property :win
  end
end
