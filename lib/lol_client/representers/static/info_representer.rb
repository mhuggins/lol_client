require 'representable/json'

class LolClient
  module Static
    class InfoRepresenter < Representable::Decorator
      include Representable::JSON

      property :attack
      property :defense
      property :difficulty
      property :magic
    end
  end
end
