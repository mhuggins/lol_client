require 'representable/json'

class LolClient
  module Static
    class GoldRepresenter < Representable::Decorator
      include Representable::JSON

      property :base
      property :purchasable
      property :sell
      property :total
    end
  end
end
