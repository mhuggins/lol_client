require 'representable/json/hash'
require 'lol_client/models/static/summoner_spell'
require 'lol_client/representers/static/summoner_spell_representer'

class LolClient
  module Static
    class SummonerSpellsRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      self.representation_wrap = :data

      values extend: SummonerSpellRepresenter, class: SummonerSpell
    end
  end
end
