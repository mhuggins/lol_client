require 'representable/json/collection'
require 'lol_client/models/league'
require 'lol_client/representers/league_representer'

class LolClient
  class LeaguesRepresenter < Representable::Decorator
    include Representable::JSON::Collection

    items extend: LeagueRepresenter, class: League
  end
end
