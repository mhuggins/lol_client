require 'lol_client/models/base'

class LolClient
  module Static
    class SpellVars < ModelBase
      attributes :coeff, :dyn, :key, :link
    end
  end
end
