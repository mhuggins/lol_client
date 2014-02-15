require 'representable/json/hash'
require 'lol_client/models/summoner'
require 'lol_client/representers/summoner_representer'

class LolClient
  class SummonersRepresenter < Representable::Decorator
    include Representable::JSON::Hash

    values extend: SummonerRepresenter, class: Summoner
  end
end
