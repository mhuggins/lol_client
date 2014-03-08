require 'representable/json'

class LolClient
  module Static
    class LevelTipRepresenter < Representable::Decorator
      include Representable::JSON

      collection :effects, as: :effect
      collection :labels, as: :label
    end
  end
end
