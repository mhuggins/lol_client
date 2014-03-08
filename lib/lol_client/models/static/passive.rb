require 'lol_client/models/base'

class LolClient
  module Static
    class Passive < ModelBase
      attributes :name, :description, :image
    end
  end
end
