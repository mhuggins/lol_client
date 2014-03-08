# LolClient

[![Build Status](https://secure.travis-ci.org/mhuggins/lol_client.png)](http://travis-ci.org/mhuggins/lol_client)
[![Code Climate](https://codeclimate.com/github/mhuggins/lol_client.png)](https://codeclimate.com/github/mhuggins/lol_client)

LolClient is a RubyGem that makes it easy to communicate with Riot's
[League of Legends API](https://developer.riotgames.com/).

## Installation

Add this line to your application's Gemfile:

    gem 'lol_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lol_client

## Documentation

The [full documentation](http://rubydoc.info/github/mhuggins/lol_client/master/frames)
can be found on rubydoc.info.

## Usage

After including the gem in your project, instantiate a new `LolClient`
instance.  Optionally, a region can be passed as well.  If unspecified, the
region defaults to `:na` (North America).

    client = LolClient.new('YOUR_API_KEY')            # => #<LolClient>
    client = LolClient.new('YOUR_API_KEY', :euw)      # => #<LolClient>

All API calls happen through your `LolClient` instance.  Unless otherwise
specified by API the documentation, each call counts towards the use of your rate limit. A basic explanation of
each call is included below.

### Champions

Calling the `champions` method returns an array of `LolClient::Champion`
objects.

    champions = client.champions                      # => [#<LolClient::Champion>, ...]
    champions.size                                    # => 118

    champion = champions.first                        # => #<LolClient::Champion>
    champion.id                                       # => 266
    champion.name                                     # => "Aatrox"
    champion.active?                                  # => true
    champion.bot_enabled?                             # => false
    champion.bot_mm_enabled?                          # => false
    champion.free_to_play?                            # => false
    champion.ranked_play_enabled?                     # => true
    champion.attack_rank                              # => 8
    champion.defense_rank                             # => 4
    champion.difficulty_rank                          # => 6
    champion.magic_rank                               # => 3

### Summoner(s) By Name

Calling the `summoner_by_name` method with a summoner name will return a
`LolClient::Summoner` object.

    summoner = client.summoner_by_name('Finklebaum')  # => #<LolClient::Summoner>
    summoner.id                                       # => 45444628
    summoner.level                                    # => 30
    summoner.name                                     # => "Finklebaum"
    summoner.profile_icon_id                          # => 6
    summoner.revised_at                               # => 2014-03-08 05:53:38 -0700

Calling the `summoners_by_name` method with an array of summoner names will
return a hash of `LolClient::Summoner` objects.  The hash keys are the
lower-cased summoner names.

    summoners = client.summoners_by_name(%w[Finklebaum Bjergsen])
    # => {"bjergsen" => #<LolClient::Summoner>, "finklebaum" => #<LolClient::Summoner>}

### Summoner(s)

Calling the `summoner` method with a summoner ID will return a
`LolClient::Summoner` object.

    summoner = client.summoner(45444628)
    # => #<LolClient::Summoner>

Calling the `summoners` method with an array of summoner IDs will return a hash
of `LolClient::Summoner` objects.  The hash keys are the summoner IDs.

    summoners = client.summoners([33010896, 45444628])
    # => {"33010896" => #<LolClient::Summoner>, "45444628" => #<LolClient::Summoner>}

### Summoner Name(s)

Calling the `summoner_name` method with a summoner ID will return the
summoner's name as a string.

    name = client.summoner_name(45444628)
    # => "Finklebaum"

Calling the `summoner_names` method with an array of summoner IDs will return
the summoner names as a hash.  The hash keys are the summoner IDs.

    names = client.summoner_names([33010896, 45444628])
    # => {"33010896"=>"Bjergsen", "45444628"=>"Finklebaum"}

### Recent Games

Calling the `recent_games` method with a summoner's ID returns an array of
`LolClient::Game` objects.

    games = client.recent_games(45444628)             # => [#<LolClient::Game>, ...]
    games.zie                                         # => 10

    game = games.first                                # => #<LolClient::Game>
    game.id                                           # => 1302213136
    game.mode                                         # => "CLASSIC"
    game.type                                         # => "MATCHED_GAME"
    game.type                                         # => "RANKED_SOLO_5x5"
    game.team_id                                      # => 200
    game.created_at                                   # => 2014-03-08 13:53:36 -0700
    game.invalid?                                     # => false
    game.level                                        # => 30
    game.map_id                                       # => 1
    game.champion_id                                  # => 115
    game.spell1                                       # => 4
    game.spell2                                       # => 14

    stats = game.raw_stats                            # => #<LolClient::RawStats>
    stats.assists                                     # => 5
    stats.champions_killed                            # => 5
    stats.double_kills                                # => 1
    stats.gold_earned                                 # => 11164
    stats.gold_spent                                  # => 11745
    stats.item0                                       # => 3157
    stats.item1                                       # => 3174
    stats.item2                                       # => 1056
    stats.item3                                       # => 3255
    stats.item4                                       # => 1026
    stats.item5                                       # => 1058
    stats.item6                                       # => 3340
    stats.killing_sprees                              # => 1
    stats.largest_killing_spree                       # => 3
    stats.largest_multi_kill                          # => 2
    stats.level                                       # => 16
    stats.magic_damage_dealt_player                   # => 131246
    stats.magic_damage_dealt_to_champions             # => 23346
    stats.magic_damage_taken                          # => 9182
    stats.minions_killed                              # => 173
    stats.neutral_minions_killed                      # => 4
    stats.neutral_minions_killed_your_jungle          # => 4
    stats.num_deaths                                  # => 10
    stats.physical_damage_dealt_player                # => 12085
    stats.physical_damage_dealt_to_champions          # => 953
    stats.physical_damage_taken                       # => 13583
    stats.team                                        # => 200
    stats.time_played                                 # => 2177
    stats.total_damage_dealt                          # => 144948
    stats.total_damage_dealt_to_champions             # => 25886
    stats.total_damage_taken                          # => 23281
    stats.total_heal                                  # => 1307
    stats.total_time_crowd_control_dealt              # => 604
    stats.total_units_healed                          # => 1
    stats.true_damage_dealt_player                    # => 1616
    stats.true_damage_dealt_to_champions              # => 1586
    stats.true_damage_taken                           # => 516
    stats.ward_placed                                 # => 6
    stats.win?                                        # => false

    players = game.fellow_players                     # => [#<LolClient::Player>, ...]
    players.size                                      # => 200

    player = game.fellow_players.first                # => #<LolClient::Player>
    player.champion_id                                # => 37
    player.summoner_id                                # => 27796912
    player.team_id                                    # => 100

### Leagues & League Entries

Calling the `leagues` method with a summoner ID returns an array of
`LolClient::League` objects.

    leagues = client.leagues(45444628)                # => [#<LolClient::League>, ...]
    leagues.size                                      # => 1

    league = leagues.first                            # => #<LolClient::League>
    league.name                                       # => "Riven's Fists"
    league.queue                                      # => "RANKED_SOLO_5x5"
    league.tier                                       # => "BRONZE"

    entries = league.entries                          # => [#<LolClient::LeagueEntry>, ...]
    entries.size                                      # => 174

    entry = league.entries.first                      # => #<LolClient::LeagueEntry>
    entry.fresh_blood?                                # => true
    entry.hot_streak?                                 # => false
    entry.inactive?                                   # => false
    entry.last_played                                 # => -1
    entry.name                                        # => "Riven's Fists"
    entry.points                                      # => 0
    entry.player_or_team_id                           # => "24511364"
    entry.player_or_team_name                         # => "Krispycakes"
    entry.queue_type                                  # => "RANKED_SOLO_5x5"
    entry.rank                                        # => "II"
    entry.tier                                        # => "BRONZE"
    entry.veteran?                                    # => false
    entry.wins                                        # => 5

Calling the `league_entries` method with a summoner ID returns an array of
`LolClient::LeagueEntry` objects.

    entries = client.league_entries(45444628)         # => [#<LolClient::LeagueEntry>, ...]
    entries.size                                      # => 1

### Challenger League

Calling the `challenger_league` method with a league type returns a
`LolClient::League` object.  The league type can be one of `:RANKED_SOLO_5x5`,
`:RANKED_TEAM_3x3`, or `:RANKED_TEAM_5x5`.

    league = client.challenger_league(:RANKED_SOLO_5x5)  # => #<LolClient::League>
    league.name                                          # => "Taric's Enforcers"
    league.queue                                         # => "RANKED_SOLO_5x5"
    league.tier                                          # => "CHALLENGER"
    league.entries                                       # => [#<LolClient::LeagueEntry>, ...]
    league.entries.size                                  # => 200

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
