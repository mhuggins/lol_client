require 'spec_helper'

describe LolClient::Champion do
  subject { described_class.new(attributes) }

  let(:attributes) { attributes_for :champion }

  [:id, :name, :attack_rank, :defense_rank, :difficulty_rank, :magic_rank,
   :active, :bot_enabled, :bot_mm_enabled, :free_to_play].each do |attr|
    its(attr) { should eq attributes[attr] }
  end
end
