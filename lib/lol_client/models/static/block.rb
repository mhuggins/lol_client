require 'lol_client/models/base'

class LolClient
  module Static
    class Block < ModelBase
      attributes :items, :type
    end
  end
end
