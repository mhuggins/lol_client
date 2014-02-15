require 'representable/json'

class LolClient
  class PlayerRepresenter < Representable::Decorator
    include Representable::JSON

    property :champion_id, as: :championId
    property :summoner_id, as: :summonerId
    property :team_id, as: :teamId
  end
end
