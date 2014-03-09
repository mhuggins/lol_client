require 'representable/json'

class LolClient
  module Static
    class MetaDataRepresenter < Representable::Decorator
      include Representable::JSON

      property :is_rune, as: :isRune
      property :tier
      property :type
    end
  end
end
