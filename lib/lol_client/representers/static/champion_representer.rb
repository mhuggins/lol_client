require 'representable/json'
require 'lol_client/models/static/champion_spell'
require 'lol_client/models/static/champion_stats'
require 'lol_client/models/static/image'
require 'lol_client/models/static/info'
require 'lol_client/models/static/champion_stats'
require 'lol_client/models/static/passive'
require 'lol_client/models/static/recommended'
require 'lol_client/models/static/skin'
require 'lol_client/representers/static/champion_spell_representer'
require 'lol_client/representers/static/champion_stats_representer'
require 'lol_client/representers/static/image_representer'
require 'lol_client/representers/static/info_representer'
require 'lol_client/representers/static/champion_stats_representer'
require 'lol_client/representers/static/passive_representer'
require 'lol_client/representers/static/recommended_representer'
require 'lol_client/representers/static/skin_representer'

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
      property :image, extend: ImageRepresenter, class: Image
      property :info, extend: InfoRepresenter, class: Info
      property :stats, extend: ChampionStatsRepresenter, class: ChampionStats
      property :passive, extend: PassiveRepresenter, class: Passive

      collection :ally_tips, as: :allytips
      collection :enemy_tips, as: :enemytips
      collection :recommended, extend: RecommendedRepresenter, class: Recommended
      collection :skins, extend: SkinRepresenter, class: Skin
      collection :spells, extend: ChampionSpellRepresenter, class: ChampionSpell
    end
  end
end
