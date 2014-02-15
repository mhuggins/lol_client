require 'lol_client/models/base'

class LolClient
  class Summoner < ModelBase
    attributes :id, :level, :name, :profile_icon_id, :revised_at
  end
end
