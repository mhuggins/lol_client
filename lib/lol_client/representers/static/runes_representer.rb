require 'representable/json'
require 'lol_client/models/static/rune'
require 'lol_client/representers/basic_data_representable'
require 'lol_client/representers/static/rune_representer'

class LolClient
  module Static
    class RunesRepresenter < Representable::Decorator
      include Representable::JSON
      include BasicDataRepresentable

      property :basic, extend: RuneRepresenter, class: Rune

      hash :data, extend: RuneRepresenter, class: Rune
    end
  end
end
