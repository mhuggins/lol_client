require 'lol_client/models/base'

class LolClient
  module Static
    class Image < ModelBase
      attributes :full, :group, :sprite, :x, :y, :width, :height
    end
  end
end
