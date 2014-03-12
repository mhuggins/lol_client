require 'lol_client/models/base'

class LolClient
  module Static
    class Rune < ModelBase
      attributes :colloq, :depth, :description, :from, :gold, :group, :image,
                 :into, :maps, :name, :plain_text, :required_champion, :rune,
                 :special_recipe, :stacks, :stats, :tags

      attributes :consume_on_full, :consumed, :hide_from_all, :in_store,
                 boolean: true
    end
  end
end
