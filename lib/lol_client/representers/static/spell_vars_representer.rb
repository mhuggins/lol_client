require 'representable/json'

class LolClient
  module Static
    class SpellVarsRepresenter < Representable::Decorator
      include Representable::JSON

      property :coeff
      property :dyn
      property :key
      property :link
    end
  end
end
