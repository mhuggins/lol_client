require 'lol_client/models/base'

class LolClient
  module Static
    class BlockItem < ModelBase
      attributes :id, :count
    end
  end
end
