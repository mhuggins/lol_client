require 'representable/json'

class LolClient
  class ChampionRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :active
    property :attack_rank, as: :attackRank
    property :bot_enabled, as: :botEnabled
    property :bot_mm_enabled, as: :botMmEnabled
    property :defense_rank, as: :defenseRank
    property :difficulty_rank, as: :difficultyRank
    property :free_to_play, as: :freeToPlay
    property :magic_rank, as: :magicRank
    property :ranked_play_enabled, as: :rankedPlayEnabled
  end
end
