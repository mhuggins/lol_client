require 'lol_client/models/base'

class LolClient
  class LeagueEntry < ModelBase
    attributes :last_played, :name, :points, :mini_series, :player_or_team_id,
               :player_or_team_name, :queue_type, :rank, :tier, :wins
    attributes :fresh_blood, :hot_streak, :inactive, :veteran, boolean: true
  end
end
