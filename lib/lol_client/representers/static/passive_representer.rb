require 'representable/json'
require 'lol_client/models/static/image'
require 'lol_client/representers/static/image_representer'

class LolClient
  module Static
    class PassiveRepresenter < Representable::Decorator
      include Representable::JSON

      property :name
      property :description
      property :image, extend: Static::ImageRepresenter, class: Static::Image
    end
  end
end
