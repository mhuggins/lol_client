require 'representable/json'

class LolClient
  module Static
    class SkinRepresenter < Representable::Decorator
      include Representable::JSON

      property :id
      property :name
      property :num
    end
  end
end
