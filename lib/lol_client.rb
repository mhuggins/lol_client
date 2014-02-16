require 'lol_client/models'
require 'lol_client/representers'
require 'lol_client/version'

require 'cgi'
require 'json'
require 'rest-client'
require 'set'

class LolClient
  REGIONS = [:br, :eune, :euw, :kr, :lan, :las, :na, :oce, :ru, :tr].to_set.freeze
  CHALLENGER_LEAGUE_TYPES = [:RANKED_SOLO_5x5, :RANKED_TEAM_3x3, :RANKED_TEAM_5x5].to_set.freeze

  attr_reader :region

  # Instantiates a new League of Legends REST API client.
  #
  # @param api_key [String] your private API key generated from
  #   {https://developer.riotgames.com/ Riot Games API}.
  # @param region [Symbol] the region this client is associated with.  Must be
  #   one of the values defined in {REGIONS}.
  def initialize(api_key, region = :na)
    @api_key = api_key
    @region = region

    raise ArgumentError, 'invalid API key' unless api_key.is_a?(String)
    raise ArgumentError, "invalid region, must be one of: #{REGIONS.map(&:inspect).join(', ')}" unless REGIONS.include?(region)
  end

  # Returns a string containing a human-readable representation of this object.
  #
  # @return [String] the human-readable representation of this object.
  def inspect
    super
    hex_id = '%x' % (object_id << 1)
    hex_id = "0x#{hex_id.rjust(14, '0')}"

    "#<#{self.class.name}:#{hex_id} @region=#{region.inspect}>"
  end

  # Retrieves all champions.
  #
  # @return [Array] the list of {Champion} objects.
  def champions
    url = url_for("#{region}/v1.1/champion")
    get url, ChampionsRepresenter.new([])
  end

  # Retrieves recent games for a summoner.
  #
  # @param summoner_id [Fixnum] the player's summoner ID.
  # @return [Array] the list of {Game} objects.
  def recent_games(summoner_id)
    url = url_for("#{region}/v1.3/game/by-summoner/#{summoner_id}/recent")
    get url, GamesRepresenter.new([])
  end

  # Retrieves challenger tier leagues.
  #
  # @param type [Symbol] the type of league to retrieve.  Must be one of the
  #   values defined in {CHALLENGER_LEAGUE_TYPES}.
  # @return [League] the challenger league.
  def challenger_league(type)
    raise ArgumentError, "invalid league type, must be one of: #{CHALLENGER_LEAGUE_TYPES.map(&:inspect).join(', ')}" unless CHALLENGER_LEAGUE_TYPES.include?(type)

    url = url_for("#{region}/v2.3/league/challenger", type: type)
    get url, LeagueRepresenter.new(League.new)
  end

  # Retrieves league entries data for a summoner, including league entries for
  # all of the summoner's teams.
  #
  # @param summoner_id [Fixnum] the player's summoner ID.
  # @return [Array] the list of {LeagueEntry} objects.
  def league_entries(summoner_id)
    url = url_for("#{region}/v2.3/league/by-summoner/#{summoner_id}/entry")
    get url, LeagueEntriesRepresenter.new([])
  end

  # Retrieves leagues data for a summoner, including leagues for all of the
  # summoner's teams.
  #
  # @param summoner_id [Fixnum] the player's summoner ID.
  # @return [Array] the list of {LeagueEntry} objects.
  def leagues(summoner_id)
    url = url_for("#{region}/v2.3/league/by-summoner/#{summoner_id}")
    get url, LeaguesRepresenter.new([])
  end

  # Retrieves summoner data for one or more summoners.
  #
  # @param summoner_ids [Array, String, Fixnum] one or more summoner IDs.
  # @return [Hash] the {Summoner} objects, where each key is a string
  #   representing a requested summoner ID.
  def summoners(summoner_ids)
    summoner_ids = array_options(summoner_ids)
    url = url_for("#{region}/v1.3/summoner/#{summoner_ids.join(',')}")
    get url, SummonersRepresenter.new({})
  end

  # Retrieves summoner data for a single summoner.
  #
  # @param summoner_id [Fixnum] the player's summoner ID.
  # @return [Summoner] the summoner's data.
  def summoner(summoner_id)
    summoner_ids = array_options(summoner_id)
    summoner_id = summoner_ids.first
    raise ArgumentError, 'invalid summoner ID' if summoner_ids.size != 1

    summoners(summoner_id)[summoner_id]
  end

  # Retrieves summoner data for one or more summoners.
  #
  # @param summoner_names [Array, String] one or more summoner names.
  # @return [Array] the {Summoner} objects, where each key is a string
  #   representing a requested lower-case summoner name.
  def summoners_by_name(summoner_names)
    summoner_names = array_options(summoner_names)
    url = url_for("#{region}/v1.3/summoner/by-name/#{summoner_names.join(',')}")
    get url, SummonersRepresenter.new({})
  end

  # Retrieves summoner data for a single summoner.
  #
  # @param summoner_name [String] the player's summoner name.
  # @return [Summoner] the summoner's data.
  def summoner_by_name(summoner_name)
    summoner_names = array_options(summoner_name)
    summoner_name = summoner_names.first
    raise ArgumentError, 'invalid summoner name' if summoner_names.size != 1

    summoners_by_name(summoner_name)[summoner_name.downcase]
  end

  # Retrieves summoner names for one or more summoners.
  #
  # @param summoner_ids [Array, String, Fixnum] one or more summoner IDs.
  # @return [Hash] the summoner names, where each key is a string representing
  #   a requested summoner ID.
  def summoner_names(summoner_ids)
    summoner_ids = array_options(summoner_ids)
    url = url_for("#{region}/v1.3/summoner/#{summoner_ids.join(',')}/name")
    get url, SummonerNamesRepresenter.new({})
  end

  # Retrieves summoner name for a single summoner.
  #
  # @param summoner_id [Fixnum] the player's summoner ID.
  # @return [Summoner] the summoner's data.
  def summoner_name(summoner_id)
    summoner_ids = array_options(summoner_id)
    summoner_id = summoner_ids.first
    raise ArgumentError, 'invalid summoner ID' if summoner_ids.size != 1

    summoner_names(summoner_id)[summoner_id]
  end

  private

  attr_reader :api_key

  def url_for(path, params = {})
    url = "https://prod.api.pvp.net/api/lol/#{path}"

    query = params.merge(api_key: api_key)
    query = query.map { |k,v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')
    query = nil if query.empty?

    [url, query].compact.join('?')
  end

  def get(url, representer)
    response = begin
                 RestClient.get(url).body
               rescue RestClient::Exception => e
                 raise RequestError, e.message
               end

    representer.from_json(response)
  end

  def array_options(values)
    [*values].join(',').split(',').map(&:strip).reject(&:empty?).compact
  end

  class RequestError < StandardError
  end
end
