require 'representable/json/collection'
require 'lol_client/models/league_entry'
require 'lol_client/representers/league_entry_representer'

class LolClient
  class LeagueEntriesRepresenter < Representable::Decorator
    include Representable::JSON::Collection

    items extend: LeagueEntryRepresenter, class: LeagueEntry
  end
end
