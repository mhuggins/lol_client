require 'lol_client/models/base'

class LolClient
  module Static
    class LevelTip < ModelBase
      attributes :effects, :labels
    end
  end
end
