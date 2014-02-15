FactoryGirl.define do
  factory :league_mini_series, class: LolClient::LeagueMiniSeries do
    losses { (1..3).to_a.sample }
    progress { ('W' * (1..3).to_a.sample).ljust(3, 'N') }
    target { (1..3).to_a.sample }
    time_left_to_play { (1..86400).to_a.sample }
    wins { (1..3).to_a.sample }
  end
end
