require 'lol_client/models/base'

class LolClient
  module Static
    class Stats < ModelBase
      attributes :armor, :armor_per_level, :attack_damage, :attack_damage_per_level,
                 :attack_range, :attack_speed_offset, :attack_speed_per_level, :crit,
                 :crit_per_level, :hp, :hp_per_level, :hp_regen, :hp_regen_per_level,
                 :move_speed, :mp, :mp_per_level, :mp_regen, :mp_regen_per_level,
                 :spell_block, :spell_block_per_level
    end
  end
end
