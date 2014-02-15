require 'lol_client/models/base'

class LolClient
  class LeagueMiniSeries < ModelBase
    attributes :losses, :progress, :target, :time_left_to_play, :wins
  end
end
