require 'lol_client/models/base'

class LolClient
  module Static
    class MetaData < ModelBase
      attributes :tier, :type
      attributes :is_rune, boolean: true
    end
  end
end
