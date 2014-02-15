require 'lol_client/models/base'

class LolClient
  class Game < ModelBase
    attributes :id, :mode, :type, :sub_type, :team_id, :created_at, :fellow_players,
               :level, :map_id, :champion_id, :spell1, :spell2, :raw_stats
    attributes :invalid, boolean: true
  end
end
