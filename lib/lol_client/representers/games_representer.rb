require 'representable/json/collection'
require 'lol_client/models/game'
require 'lol_client/representers/game_representer'

class LolClient
  class GamesRepresenter < Representable::Decorator
    include Representable::JSON::Collection

    self.representation_wrap = :games

    items extend: GameRepresenter, class: Game
  end
end
