require 'lol_client/models/base'

class LolClient
  module Static
    class Mastery < ModelBase
      attributes :id, :name, :description, :image, :prerequisite, :ranks
    end
  end
end
