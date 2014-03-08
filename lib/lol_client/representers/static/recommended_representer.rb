require 'representable/json'
require 'lol_client/models/static/block'
require 'lol_client/representers/static/block_representer'

class LolClient
  module Static
    class RecommendedRepresenter < Representable::Decorator
      include Representable::JSON

      property :champion
      property :map
      property :mode
      property :priority
      property :title
      property :type

      collection :blocks, extend: Static::BlockRepresenter, class: Static::Block
    end
  end
end
