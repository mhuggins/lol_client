require 'lol_client/models/base'

class LolClient
  module Static
    class BasicDataStats < ModelBase
      attributes :flat_armor_mod, :flat_attack_speed_mod, :flat_block_mod, :flat_crit_chance_mod,
                 :flat_crit_damage_mod, :flat_exp_bonus, :flat_energy_pool_mod, :flat_energy_regen_mod,
                 :flat_hp_pool_mod, :flat_hp_regen_mod, :flat_mp_pool_mod, :flat_mp_regen_mod,
                 :flat_magic_damage_mod, :flat_movement_speed_mod, :flat_physical_damage_mod,
                 :flat_spell_block_mod, :percent_armor_mod, :percent_attack_speed_mod,
                 :percent_block_mod, :percent_crit_chance_mod, :percent_crit_damage_mod,
                 :percent_dodge_mod, :percent_exp_bonus, :percent_hp_pool_mod, :percent_hp_regen_mod,
                 :percent_life_steal_mod, :percent_mp_pool_mod, :percent_mp_regen_mod,
                 :percent_magic_damage_mod, :percent_movement_speed_mod, :percent_physical_damage_mod,
                 :percent_spell_block_mod, :percent_spell_vamp_mod, :flat_armor_mod_per_level,
                 :flat_armor_penetration_mod, :flat_armor_penetration_mod_per_level,
                 :flat_crit_chance_mod_per_level, :flat_crit_damage_mod_per_level, :flat_dodge_mod,
                 :flat_dodge_mod_per_level, :flat_energy_mod_per_level, :flat_energy_regen_mod_per_level,
                 :flat_gold_per10_mod, :flat_hp_mod_per_level, :flat_hp_regen_mod_per_level,
                 :flat_mp_mod_per_level, :flat_mp_regen_mod_per_level, :flat_magic_damage_mod_per_level,
                 :flat_magic_penetration_mod, :flat_magic_penetration_mod_per_level,
                 :flat_movement_speed_mod_per_level, :flat_physical_damage_mod_per_level,
                 :flat_spell_block_mod_per_level, :flat_time_dead_mod, :flat_time_dead_mod_per_level,
                 :percent_armor_penetration_mod, :percent_armor_penetration_mod_per_level,
                 :percent_attack_speed_mod_per_level, :percent_cooldown_mod,
                 :percent_cooldown_mod_per_level, :percent_magic_penetration_mod,
                 :percent_magic_penetration_mod_per_level, :percent_movement_speed_mod_per_level,
                 :percent_time_dead_mod, :percent_time_dead_mod_per_level
    end
  end
end
