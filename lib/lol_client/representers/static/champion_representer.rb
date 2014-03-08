require 'representable/json'
require 'lol_client/models/static/image'
require 'lol_client/models/static/info'
require 'lol_client/models/static/stats'
require 'lol_client/models/static/passive'
require 'lol_client/models/static/recommended'
require 'lol_client/models/static/skin'
require 'lol_client/models/static/spell'
require 'lol_client/models/static/stats'
require 'lol_client/representers/static/image_representer'
require 'lol_client/representers/static/info_representer'
require 'lol_client/representers/static/stats_representer'
require 'lol_client/representers/static/passive_representer'
require 'lol_client/representers/static/recommended_representer'
require 'lol_client/representers/static/skin_representer'
require 'lol_client/representers/static/spell_representer'
require 'lol_client/representers/static/stats_representer'

class LolClient
  module Static
    class ChampionRepresenter < Representable::Decorator
      include Representable::JSON

      property :id
      property :name
      property :blurb
      property :key
      property :lore
      property :par_type, as: :partype
      property :tags
      property :title
      property :image, extend: Static::ImageRepresenter, class: Static::Image
      property :info, extend: Static::InfoRepresenter, class: Static::Info
      property :stats, extend: Static::StatsRepresenter, class: Static::Stats
      property :passive, extend: Static::PassiveRepresenter, class: Static::Passive

      collection :ally_tips, as: :allytips #, class: String
      collection :enemy_tips, as: :enemytips #, class: String
      collection :recommended, extend: Static::RecommendedRepresenter, class: Static::Recommended
      collection :skins, extend: Static::SkinRepresenter, class: Static::Skin
      collection :spells, extend: Static::SpellRepresenter, class: Static::Spell
    end
  end
end
