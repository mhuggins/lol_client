require 'lol_client/models/base'

class LolClient
  module Static
    class Spell < ModelBase
      attributes :id, :name, :cooldown, :cooldown_burn, :cost, :cost_burn, :cost_type,
                 :description, :effect, :effect_burn, :image, :level_tip, :max_rank,
                 :range, :range_burn, :resource, :tool_tip, :vars
    end
  end
end
