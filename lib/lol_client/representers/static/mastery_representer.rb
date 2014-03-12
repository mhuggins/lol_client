require 'representable/json'
require 'lol_client/models/static/image'
require 'lol_client/representers/static/image_representer'

class LolClient
  module Static
    class MasteryRepresenter < Representable::Decorator
      include Representable::JSON

      property :id
      property :image, extend: ImageRepresenter, class: Image
      property :name
      property :prerequisite, as: :prereq
      property :ranks

      collection :description
    end
  end
end
