require 'representable/json/hash'
require 'lol_client/models/static/mastery'
require 'lol_client/representers/static/mastery_representer'

class LolClient
  module Static
    class MasteriesRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: MasteryRepresenter, class: Mastery
    end
  end
end
