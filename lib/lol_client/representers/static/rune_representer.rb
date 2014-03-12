require 'representable/json'
require 'lol_client/models/static/basic_data_stats'
require 'lol_client/models/static/gold'
require 'lol_client/models/static/image'
require 'lol_client/models/static/meta_data'
require 'lol_client/representers/static/basic_data_stats_representer'
require 'lol_client/representers/static/gold_representer'
require 'lol_client/representers/static/image_representer'
require 'lol_client/representers/static/meta_data_representer'

class LolClient
  module Static
    class RuneRepresenter < Representable::Decorator
      include Representable::JSON

      property :colloq
      property :consume_on_full, as: :consumeOnFull
      property :consumed
      property :depth
      property :description
      property :gold, extend: GoldRepresenter, class: Gold
      property :group
      property :hide_from_all, as: :hideFromAll
      property :image, extend: ImageRepresenter, class: Image
      property :name
      property :plain_text, as: :plaintext
      property :required_champion, as: :requiredChampion
      property :rune, extend: MetaDataRepresenter, class: MetaData
      property :special_recipe, as: :specialRecipe
      property :stacks
      property :stats, extend: BasicDataStatsRepresenter, class: BasicDataStats

      collection :from
      collection :into
      collection :tags

      hash :maps
    end
  end
end
