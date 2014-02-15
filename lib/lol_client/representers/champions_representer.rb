require 'representable/json/collection'
require 'lol_client/models/champion'
require 'lol_client/representers/champion_representer'

class LolClient
  class ChampionsRepresenter < Representable::Decorator
    include Representable::JSON::Collection

    self.representation_wrap = :champions

    items extend: ChampionRepresenter, class: Champion
  end
end
