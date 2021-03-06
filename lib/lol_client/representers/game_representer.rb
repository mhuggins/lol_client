require 'representable/json'
require 'lol_client/models/player'
require 'lol_client/models/raw_stats'
require 'lol_client/representers/player_representer'
require 'lol_client/representers/raw_stats_representer'

class LolClient
  class GameRepresenter < Representable::Decorator
    include Representable::JSON

    property :id, as: :gameId
    property :mode, as: :gameMode
    property :type, as: :gameType
    property :sub_type, as: :subType
    property :team_id, as: :teamId
    property :created_at, as: :createDate, decorator_scope: true
    property :invalid
    property :level
    property :map_id, as: :mapId
    property :champion_id, as: :championId
    property :spell1
    property :spell2
    property :raw_stats, as: :stats, extend: RawStatsRepresenter, class: RawStats

    collection :fellow_players, as: :fellowPlayers, extend: PlayerRepresenter, class: Player

    def created_at
      represented.created_at.to_i * 1000
    end

    def created_at=(val)
      represented.created_at = Time.at(val / 1000)
    end
  end
end
