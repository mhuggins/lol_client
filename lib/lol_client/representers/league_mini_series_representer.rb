require 'representable/json'

class LolClient
  class LeagueMiniSeriesRepresenter < Representable::Decorator
    include Representable::JSON

    property :losses
    property :progress
    property :target
    property :time_left_to_play, as: :timeLeftToPlayMillis
    property :wins
  end
end
