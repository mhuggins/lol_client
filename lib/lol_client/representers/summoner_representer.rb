require 'representable/json'

class LolClient
  class SummonerRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :level, as: :summonerLevel
    property :name
    property :profile_icon_id, as: :profileIconId
    property :revised_at, as: :revisionDate, decorator_scope: true

    def revised_at
      represented.revised_at.to_i * 1000
    end

    def revised_at=(val)
      represented.revised_at = Time.at(val / 1000)
    end
  end
end
