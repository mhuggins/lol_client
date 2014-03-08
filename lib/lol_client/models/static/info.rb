require 'lol_client/models/base'

class LolClient
  module Static
    class Info < ModelBase
      attributes :attack, :defense, :difficulty, :magic
    end
  end
end
