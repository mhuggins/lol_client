require 'representable/json'

class LolClient
  module Static
    class BlockItemRepresenter < Representable::Decorator
      include Representable::JSON

      property :id
      property :count
    end
  end
end
