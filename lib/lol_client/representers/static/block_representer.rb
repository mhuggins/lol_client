require 'representable/json'
require 'lol_client/models/static/block_item'
require 'lol_client/representers/static/block_item_representer'

class LolClient
  module Static
    class BlockRepresenter < Representable::Decorator
      include Representable::JSON

      property :type

      collection :items, extend: BlockItemRepresenter, class: BlockItem
    end
  end
end
