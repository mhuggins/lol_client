require 'representable/json/hash'
require 'lol_client/models/static/item'
require 'lol_client/representers/static/item_representer'

class LolClient
  module Static
    class ItemsRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: ItemRepresenter, class: Item
    end
  end
end
