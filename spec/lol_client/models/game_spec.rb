require 'spec_helper'

describe LolClient::Game do
  subject { described_class.new(attributes) }

  let(:attributes) { attributes_for :game }

  [:id, :mode, :type, :sub_type, :team_id, :created_at, :fellow_players,
   :invalid, :level, :map_id, :champion_id, :spell1, :spell2, :raw_stats].each do |attr|
    its(attr) { should eq attributes[attr] }
  end
end
