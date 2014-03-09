require 'representable/json'

class LolClient
  module Static
    class ChampionStatsRepresenter < Representable::Decorator
      include Representable::JSON

      property :armor
      property :armor_per_level, as: :armorperlevel
      property :attack_damage, as: :attackdamage
      property :attack_damage_per_level, as: :attackdamageperlevel
      property :attack_range, as: :attackrange
      property :attack_speed_offset, as: :attackspeedoffset
      property :attack_speed_per_level, as: :attackspeedperlevel
      property :crit
      property :crit_per_level, as: :critperlevel
      property :hp
      property :hp_per_level, as: :hpperlevel
      property :hp_regen, as: :hpregen
      property :hp_regen_per_level, as: :hpregenperlevel
      property :move_speed, as: :movespeed
      property :mp
      property :mp_per_level, as: :mpperlevel
      property :mp_regen, as: :mpregen
      property :mp_regen_per_level, as: :mpregenperlevel
      property :spell_block, as: :spellblock
      property :spell_block_per_level, as: :spellblockperlevel
    end
  end
end
