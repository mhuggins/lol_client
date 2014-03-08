require 'representable/json'
require 'lol_client/models/static/image'
require 'lol_client/models/static/level_tip'
require 'lol_client/models/static/spell_vars'
require 'lol_client/representers/static/image_representer'
require 'lol_client/representers/static/level_tip_representer'
require 'lol_client/representers/static/spell_vars_representer'

class LolClient
  module Static
    class SpellRepresenter < Representable::Decorator
      include Representable::JSON

      property :id
      property :cooldown_burn, as: :cooldownBurn
      property :cost_burn, as: :costBurn
      property :cost_type, as: :costType
      property :description
      property :image, extend: Static::ImageRepresenter, class: Static::Image
      property :level_tip, as: :leveltip, extend: Static::LevelTipRepresenter, class: Static::LevelTip
      property :max_rank, as: :maxrank
      property :name
      property :range
      property :range_burn, as: :rangeBurn
      property :resource
      property :tool_tip, as: :tooltip

      collection :cooldown
      collection :cost
      collection :effect
      collection :effect_burn, as: :effectBurn
      collection :vars, extend: Static::SpellVarsRepresenter, class: Static::SpellVars
    end
  end
end
