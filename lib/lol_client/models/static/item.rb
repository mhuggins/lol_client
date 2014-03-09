require 'lol_client/models/base'

class LolClient
  module Static
    class Item < ModelBase
      attributes :colloq, :depth, :description, :from, :gold, :group, :image,
                 :in_store, :into, :maps, :name, :plain_text, :required_champion,
                 :rune, :special_recipe, :stacks, :stats, :tags
      attributes :consume_on_full, :consumed, :hide_from_all, boolean: true
    end
  end
end
