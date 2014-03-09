require 'representable/json'
require 'lol_client/models/static/gold'
require 'lol_client/models/static/image'
require 'lol_client/models/static/item_stats'
require 'lol_client/models/static/meta_data'
require 'lol_client/representers/static/gold_representer'
require 'lol_client/representers/static/image_representer'
require 'lol_client/representers/static/item_stats_representer'
require 'lol_client/representers/static/meta_data_representer'

class LolClient
  module Static
    class ItemRepresenter < Representable::Decorator
      include Representable::JSON

      property :colloq
      property :consume_on_full
      property :consumed
      property :depth
      property :description
      property :gold, extend: GoldRepresenter, class: Gold
      property :group
      property :hide_from_all
      property :image, extend: ImageRepresenter, class: Image
      property :in_store
      property :maps
      property :name
      property :plain_text
      property :required_champion
      property :rune, extend: MetaDataRepresenter, class: MetaData
      property :special_recipe
      property :stacks
      property :stats, extend: ItemStatsRepresenter, class: ItemStats

      collection :from
      collection :into
      collection :tags

      hash :maps
    end
  end
end
