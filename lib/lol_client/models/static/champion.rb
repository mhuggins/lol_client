require 'lol_client/models/base'

class LolClient
  module Static
    class Champion < ModelBase
      attributes :id, :name, :ally_tips, :blurb, :enemy_tips, :image, :info, :key, :lore,
                 :par_type, :passive, :recommended, :skins, :spells, :stats, :tags, :title
    end
  end
end
