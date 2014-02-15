require 'lol_client/models/base'

class LolClient
  class Champion < ModelBase
    attributes :id, :name, :attack_rank, :defense_rank, :difficulty_rank, :magic_rank
    attributes :active, :bot_enabled, :bot_mm_enabled, :free_to_play, :ranked_play_enabled, boolean: true
  end
end
