require 'representable/json'

class LolClient
  module Static
    class ImageRepresenter < Representable::Decorator
      include Representable::JSON

      property :full
      property :group
      property :sprite
      property :x
      property :y
      property :width, as: :w
      property :height, as: :h
    end
  end
end
