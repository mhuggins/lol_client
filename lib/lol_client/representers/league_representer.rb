require 'representable/json'
require 'lol_client/models/league_entry'
require 'lol_client/representers/league_entry_representer'

class LolClient
  class LeagueRepresenter < Representable::Decorator
    include Representable::JSON

    property :name
    property :participant_id, as: :participantId
    property :queue
    property :tier

    collection :entries, extend: LeagueEntryRepresenter, class: LeagueEntry
  end
end
