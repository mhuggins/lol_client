require 'lol_client/models/base'

class LolClient
  class League < ModelBase
    attributes :entries, :name, :participant_id, :queue, :tier
  end
end
