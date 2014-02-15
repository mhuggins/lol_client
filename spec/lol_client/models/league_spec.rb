require 'spec_helper'

describe LolClient::League do
  subject { described_class.new(attributes) }

  let(:attributes) { attributes_for :league }

  [:entries, :name, :participant_id, :queue, :tier].each do |attr|
    its(attr) { should eq attributes[attr] }
  end
end
