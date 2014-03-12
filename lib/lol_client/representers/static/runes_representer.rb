require 'representable/json/hash'
require 'lol_client/models/static/rune'
require 'lol_client/representers/static/rune_representer'

class LolClient
  module Static
    class RunesRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: RuneRepresenter, class: Rune
    end
  end
end
