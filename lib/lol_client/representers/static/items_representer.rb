require 'representable/json'
require 'lol_client/models/static/item'
require 'lol_client/representers/basic_data_representable'
require 'lol_client/representers/static/item_representer'

class LolClient
  module Static
    class ItemsRepresenter < Representable::Decorator
      include Representable::JSON
      include BasicDataRepresentable

      property :basic, extend: ItemRepresenter, class: Item

      hash :data, extend: ItemRepresenter, class: Item
    end
  end
end
