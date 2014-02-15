require 'spec_helper'

describe LolClient::Player do
  subject { described_class.new(attributes) }

  let(:attributes) { attributes_for :player }

  [:champion_id, :summoner_id, :team_id].each do |attr|
    its(attr) { should eq attributes[attr] }
  end
end
