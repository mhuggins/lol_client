require 'representable/json/hash'

class LolClient
  class SummonerNamesRepresenter < Representable::Decorator
    include Representable::JSON::Hash
  end
end
