require 'representable/json'
require 'lol_client/models/league_mini_series'
require 'lol_client/representers/league_mini_series_representer'

class LolClient
  class LeagueEntryRepresenter < Representable::Decorator
    include Representable::JSON

    property :fresh_blood, as: :isFreshBlood
    property :hot_streak, as: :isHotStreak
    property :inactive, as: :isInactive
    property :last_played, as: :lastPlayed
    property :name, as: :leagueName
    property :points, as: :leaguePoints
    property :mini_series, as: :miniSeries, extend: LeagueMiniSeriesRepresenter, class: LeagueMiniSeries
    property :player_or_team_id, as: :playerOrTeamId
    property :player_or_team_name, as: :playerOrTeamName
    property :queue_type, as: :queueType
    property :rank
    property :tier
    property :veteran, as: :isVeteran
    property :wins
  end
end
