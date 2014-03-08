require 'lol_client/models/base'

class LolClient
  module Static
    class Skin < ModelBase
      attributes :id, :name, :num
    end
  end
end
