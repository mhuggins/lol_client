require 'representable/json'

class LolClient
  module Static
    class BasicDataStatsRepresenter < Representable::Decorator
      include Representable::JSON

      property :flat_armor_mod, as: :FlatArmorMod
      property :flat_attack_speed_mod, as: :FlatAttackSpeedMod
      property :flat_block_mod, as: :FlatBlockMod
      property :flat_crit_chance_mod, as: :FlatCritChanceMod
      property :flat_crit_damage_mod, as: :FlatCritDamageMod
      property :flat_exp_bonus, as: :FlatEXPBonus
      property :flat_energy_pool_mod, as: :FlatEnergyPoolMod
      property :flat_energy_regen_mod, as: :FlatEnergyRegenMod
      property :flat_hp_pool_mod, as: :FlatHPPoolMod
      property :flat_hp_regen_mod, as: :FlatHPRegenMod
      property :flat_mp_pool_mod, as: :FlatMPPoolMod
      property :flat_mp_regen_mod, as: :FlatMPRegenMod
      property :flat_magic_damage_mod, as: :FlatMagicDamageMod
      property :flat_movement_speed_mod, as: :FlatMovementSpeedMod
      property :flat_physical_damage_mod, as: :FlatPhysicalDamageMod
      property :flat_spell_block_mod, as: :FlatSpellBlockMod
      property :percent_armor_mod, as: :PercentArmorMod
      property :percent_attack_speed_mod, as: :PercentAttackSpeedMod
      property :percent_block_mod, as: :PercentBlockMod
      property :percent_crit_chance_mod, as: :PercentCritChanceMod
      property :percent_crit_damage_mod, as: :PercentCritDamageMod
      property :percent_dodge_mod, as: :PercentDodgeMod
      property :percent_exp_bonus, as: :PercentEXPBonus
      property :percent_hp_pool_mod, as: :PercentHPPoolMod
      property :percent_hp_regen_mod, as: :PercentHPRegenMod
      property :percent_life_steal_mod, as: :PercentLifeStealMod
      property :percent_mp_pool_mod, as: :PercentMPPoolMod
      property :percent_mp_regen_mod, as: :PercentMPRegenMod
      property :percent_magic_damage_mod, as: :PercentMagicDamageMod
      property :percent_movement_speed_mod, as: :PercentMovementSpeedMod
      property :percent_physical_damage_mod, as: :PercentPhysicalDamageMod
      property :percent_spell_block_mod, as: :PercentSpellBlockMod
      property :percent_spell_vamp_mod, as: :PercentSpellVampMod
      property :flat_armor_mod_per_level, as: :rFlatArmorModPerLevel
      property :flat_armor_penetration_mod, as: :rFlatArmorPenetrationMod
      property :flat_armor_penetration_mod_per_level, as: :rFlatArmorPenetrationModPerLevel
      property :flat_crit_chance_mod_per_level, as: :rFlatCritChanceModPerLevel
      property :flat_crit_damage_mod_per_level, as: :rFlatCritDamageModPerLevel
      property :flat_dodge_mod, as: :rFlatDodgeMod
      property :flat_dodge_mod_per_level, as: :rFlatDodgeModPerLevel
      property :flat_energy_mod_per_level, as: :rFlatEnergyModPerLevel
      property :flat_energy_regen_mod_per_level, as: :rFlatEnergyRegenModPerLevel
      property :flat_gold_per10_mod, as: :rFlatGoldPer10Mod
      property :flat_hp_mod_per_level, as: :rFlatHPModPerLevel
      property :flat_hp_regen_mod_per_level, as: :rFlatHPRegenModPerLevel
      property :flat_mp_mod_per_level, as: :rFlatMPModPerLevel
      property :flat_mp_regen_mod_per_level, as: :rFlatMPRegenModPerLevel
      property :flat_magic_damage_mod_per_level, as: :rFlatMagicDamageModPerLevel
      property :flat_magic_penetration_mod, as: :rFlatMagicPenetrationMod
      property :flat_magic_penetration_mod_per_level, as: :rFlatMagicPenetrationModPerLevel
      property :flat_movement_speed_mod_per_level, as: :rFlatMovementSpeedModPerLevel
      property :flat_physical_damage_mod_per_level, as: :rFlatPhysicalDamageModPerLevel
      property :flat_spell_block_mod_per_level, as: :rFlatSpellBlockModPerLevel
      property :flat_time_dead_mod, as: :rFlatTimeDeadMod
      property :flat_time_dead_mod_per_level, as: :rFlatTimeDeadModPerLevel
      property :percent_armor_penetration_mod, as: :rPercentArmorPenetrationMod
      property :percent_armor_penetration_mod_per_level, as: :rPercentArmorPenetrationModPerLevel
      property :percent_attack_speed_mod_per_level, as: :rPercentAttackSpeedModPerLevel
      property :percent_cooldown_mod, as: :rPercentCooldownMod
      property :percent_cooldown_mod_per_level, as: :rPercentCooldownModPerLevel
      property :percent_magic_penetration_mod, as: :rPercentMagicPenetrationMod
      property :percent_magic_penetration_mod_per_level, as: :rPercentMagicPenetrationModPerLevel
      property :percent_movement_speed_mod_per_level, as: :rPercentMovementSpeedModPerLevel
      property :percent_time_dead_mod, as: :rPercentTimeDeadMod
      property :percent_time_dead_mod_per_level, as: :rPercentTimeDeadModPerLevel
    end
  end
end
