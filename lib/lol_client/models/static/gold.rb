require 'lol_client/models/base'

class LolClient
  module Static
    class Gold < ModelBase
      attributes :base, :sell, :total
      attributes :purchasable, boolean: true
    end
  end
end
