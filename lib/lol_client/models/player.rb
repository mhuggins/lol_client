require 'lol_client/models/base'

class LolClient
  class Player < ModelBase
    attributes :champion_id, :summoner_id, :team_id
  end
end
