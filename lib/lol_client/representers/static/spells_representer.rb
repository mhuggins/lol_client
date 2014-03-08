require 'representable/json/hash'
require 'lol_client/models/static/spell'
require 'lol_client/representers/static/spell_representer'

class LolClient
  module Static
    class SpellsRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: Static::SpellRepresenter, class: Static::Spell
    end
  end
end
