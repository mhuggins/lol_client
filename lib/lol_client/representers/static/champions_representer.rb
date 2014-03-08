require 'representable/json/hash'
require 'lol_client/models/static/champion'
require 'lol_client/representers/static/champion_representer'

class LolClient
  module Static
    class ChampionsRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: Static::ChampionRepresenter, class: Static::Champion
    end
  end
end
