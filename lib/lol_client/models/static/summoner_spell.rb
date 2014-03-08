require 'lol_client/models/base'

class LolClient
  module Static
    class SummonerSpell < ModelBase
      attributes :id, :name, :cooldown, :cooldown_burn, :cost, :cost_burn, :cost_type,
                 :description, :effect, :effect_burn, :image, :key, :level_tip,
                 :max_rank, :modes, :range, :range_burn, :resource, :summoner_level,
                 :tool_tip, :vars
    end
  end
end
