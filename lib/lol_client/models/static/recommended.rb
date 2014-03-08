require 'lol_client/models/base'

class LolClient
  module Static
    class Recommended < ModelBase
      attributes :blocks, :champion, :map, :mode, :title, :type
      attributes :priority, boolean: true
    end
  end
end
