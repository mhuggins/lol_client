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

  ##
  # Stores the region associated with the client.
  #
  # @return [Symbol] The region associated with the client.
  #
  attr_reader :region

  ##
  # Instantiates a new League of Legends REST API client.
  #
  # @param api_key [String] Your private API key generated from
  #   {https://developer.riotgames.com/ Riot Games API}.
  # @param region [Symbol] The region this client is associated with.  Must be
  #   one of the values defined in {REGIONS}.
  #
  def initialize(api_key, region = :na)
    @api_key = api_key
    @region = region

    raise ArgumentError, 'invalid API key' unless api_key.is_a?(String)
    raise ArgumentError, "invalid region, must be one of: #{REGIONS.map(&:inspect).join(', ')}" unless REGIONS.include?(region)
  end

  ##
  # Returns a string containing a human-readable representation of this object.
  #
  # @return [String] The human-readable representation of this object.
  #
  def inspect
    super
    hex_id = '%x' % (object_id << 1)
    hex_id = "0x#{hex_id.rjust(14, '0')}"

    "#<#{self.class.name}:#{hex_id} @region=#{region.inspect}>"
  end

  ##
  # Retrieves all champions.
  #
  # @return [Array] The list of {Champion} objects.
  #
  def champions
    url = url_for("#{region}/v1.1/champion")
    get url, ChampionsRepresenter.new([])
  end

  ##
  # Retrieves recent games for a summoner.
  #
  # @param summoner_id [Fixnum] The player's summoner ID.
  #
  # @return [Array] The list of {Game} objects.
  #
  def recent_games(summoner_id)
    url = url_for("#{region}/v1.3/game/by-summoner/#{summoner_id}/recent")
    get url, GamesRepresenter.new([])
  end

  ##
  # Retrieves challenger tier leagues.
  #
  # @param type [Symbol] The type of league to retrieve.  Must be one of the
  #   values defined in {CHALLENGER_LEAGUE_TYPES}.
  #
  # @return [League] The challenger league.
  #
  def challenger_league(type)
    raise ArgumentError, "invalid league type, must be one of: #{CHALLENGER_LEAGUE_TYPES.map(&:inspect).join(', ')}" unless CHALLENGER_LEAGUE_TYPES.include?(type)

    url = url_for("#{region}/v2.3/league/challenger", type: type)
    get url, LeagueRepresenter.new(League.new)
  end

  ##
  # Retrieves league entries data for a summoner, including league entries for
  # all of the summoner's teams.
  #
  # @param summoner_id [Fixnum] The player's summoner ID.
  #
  # @return [Array] The list of {LeagueEntry} objects.
  #
  def league_entries(summoner_id)
    url = url_for("#{region}/v2.3/league/by-summoner/#{summoner_id}/entry")
    get url, LeagueEntriesRepresenter.new([])
  end

  ##
  # Retrieves leagues data for a summoner, including leagues for all of the
  # summoner's teams.
  #
  # @param summoner_id [Fixnum] The player's summoner ID.
  #
  # @return [Array] The list of {LeagueEntry} objects.
  #
  def leagues(summoner_id)
    url = url_for("#{region}/v2.3/league/by-summoner/#{summoner_id}")
    get url, LeaguesRepresenter.new([])
  end

  ##
  # Retrieves summoner data for one or more summoners.
  #
  # @param summoner_ids [Array, String, Fixnum] One or more summoner IDs.
  #
  # @return [Hash] The {Summoner} objects, where each key is a string
  #   representing a requested summoner ID.
  #
  def summoners(summoner_ids)
    summoner_ids = array_options(summoner_ids)
    url = url_for("#{region}/v1.3/summoner/#{summoner_ids.join(',')}")
    get url, SummonersRepresenter.new({})
  end

  ##
  # Retrieves summoner data for a single summoner.
  #
  # @param summoner_id [Fixnum] The player's summoner ID.
  #
  # @return [Summoner] The summoner's data.
  #
  def summoner(summoner_id)
    summoner_ids = array_options(summoner_id)
    summoner_id = summoner_ids.first
    raise ArgumentError, 'invalid summoner ID' if summoner_ids.size != 1

    summoners(summoner_id)[summoner_id]
  end

  ##
  # Retrieves summoner data for one or more summoners.
  #
  # @param summoner_names [Array, String] One or more summoner names.
  #
  # @return [Array] The {Summoner} objects, where each key is a string
  #   representing a requested lower-case summoner name.
  #
  def summoners_by_name(summoner_names)
    summoner_names = array_options(summoner_names)
    url = url_for("#{region}/v1.3/summoner/by-name/#{summoner_names.join(',')}")
    get url, SummonersRepresenter.new({})
  end

  ##
  # Retrieves summoner data for a single summoner.
  #
  # @param summoner_name [String] The player's summoner name.
  #
  # @return [Summoner] The summoner's data.
  #
  def summoner_by_name(summoner_name)
    summoner_names = array_options(summoner_name)
    summoner_name = summoner_names.first
    raise ArgumentError, 'invalid summoner name' if summoner_names.size != 1

    summoners_by_name(summoner_name)[summoner_name.downcase]
  end

  ##
  # Retrieves summoner names for one or more summoners.
  #
  # @param summoner_ids [Array, String, Fixnum] One or more summoner IDs.
  #
  # @return [Hash] The summoner names, where each key is a string representing
  #   a requested summoner ID.
  #
  def summoner_names(summoner_ids)
    summoner_ids = array_options(summoner_ids)
    url = url_for("#{region}/v1.3/summoner/#{summoner_ids.join(',')}/name")
    get url, SummonerNamesRepresenter.new({})
  end

  ##
  # Retrieves summoner name for a single summoner.
  #
  # @param summoner_id [Fixnum] The player's summoner ID.
  #
  # @return [Summoner] The summoner's data.
  #
  def summoner_name(summoner_id)
    summoner_ids = array_options(summoner_id)
    summoner_id = summoner_ids.first
    raise ArgumentError, 'invalid summoner ID' if summoner_ids.size != 1

    summoner_names(summoner_id)[summoner_id]
  end

  ##
  # Retrieves info for all champions.
  #
  # @param locale [String] The locale to use for champion data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for champion data.
  # @param champ_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "image", "skins", "lore", "blurb",
  #   "allytips", "enemytips", "tags", "partype", "info", "stats", "spells",
  #   "passive", and "recommended".
  #
  # @return [Hash] The {Static::Champion} objects, where each key is a string
  #   representing the champion's id.
  #
  def static_champions(locale: nil, version: nil, champ_data: nil)
    champ_data = array_options(champ_data).join(',')
    params = params_for(locale: locale, version: version, champData: champ_data)
    url = url_for("static-data/#{region}/v1/champion", params)

    get url, Static::ChampionsRepresenter.new({})
  end

  ##
  # Retrieves info for a specific champion.
  #
  # @param champion_id [Fixnum] The champion's ID.
  # @param locale [String] The locale to use for champion data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for champion data.
  # @param champ_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "image", "skins", "lore", "blurb",
  #   "allytips", "enemytips", "tags", "partype", "info", "stats", "spells",
  #   "passive", and "recommended".
  #
  # @return [Static::Champion] The champion's data.
  #
  def static_champion(champion_id, locale: nil, version: nil, champ_data: nil)
    champ_data = array_options(champ_data).join(',')
    params = params_for(locale: locale, version: version, champData: champ_data)
    url = url_for("static-data/#{region}/v1/champion/#{champion_id}", params)

    get url, Static::ChampionRepresenter.new(Static::Champion.new)
  end

  ##
  # Retrieves info for all items.
  #
  # @param locale [String] The locale to use for item data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for item data.
  # @param item_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "gold", "calloq", "consumed", "stacks",
  #   "depth", "consumeOnFull", "from", "into", "specialRecipe", "inStore",
  #   "hideFromAll", "requiredChampion", "tags", "maps", "image", and "stats".
  #
  # @return [Hash] The {Static::Item} objects, where each key is a string
  #   representing the item's id.
  #
  def static_items(locale: nil, version: nil, item_data: nil)
    item_data = array_options(item_data).join(',')
    params = params_for(locale: locale, version: version, itemListData: item_data)
    url = url_for("static-data/#{region}/v1/item", params)

    get url, Static::ItemsRepresenter.new({})
  end

  ##
  # Retrieves info for a specific item.
  #
  # @param item_id [Fixnum] The item's ID.
  # @param locale [String] The locale to use for item data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for item data.
  # @param item_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "gold", "calloq", "consumed", "stacks",
  #   "depth", "consumeOnFull", "from", "into", "specialRecipe", "inStore",
  #   "hideFromAll", "requiredChampion", "tags", "maps", "image", and "stats".
  #
  # @return [Static::Item] The item's data.
  #
  def static_item(item_id, locale: nil, version: nil, item_data: nil)
    item_data = array_options(item_data).join(',')
    params = params_for(locale: locale, version: version, itemData: item_data)
    url = url_for("static-data/#{region}/v1/item/#{item_id}", params)

    get url, Static::ItemRepresenter.new(Static::Item.new)
  end

  ##
  # Retrieves info for all masteries.
  #
  # @param locale [String] The locale to use for item data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for item data.
  # @param item_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "image", "prereq", "ranks", and "tree".
  #
  # @return [Hash] The {Static::Mastery} objects, where each key is a string
  #   representing the mastery's id.
  #
  def static_masteries(locale: nil, version: nil, mastery_data: nil)
    mastery_data = array_options(mastery_data).join(',')
    params = params_for(locale: locale, version: version, masteryListData: mastery_data)
    url = url_for("static-data/#{region}/v1/mastery", params)

    get url, Static::MasteriesRepresenter.new({})
  end

  ##
  # Retrieves info for a specific mastery.
  #
  # @param mastery_id [Fixnum] The mastery's ID.
  # @param locale [String] The locale to use for item data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for item data.
  # @param item_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "image", "prereq", "ranks", and "tree".
  #
  # @return [Static::Mastery] The mastery's data.
  #
  def static_mastery(mastery_id, locale: nil, version: nil, mastery_data: nil)
    mastery_data = array_options(mastery_data).join(',')
    params = params_for(locale: locale, version: version, masteryData: mastery_data)
    url = url_for("static-data/#{region}/v1/mastery/#{mastery_id}", params)

    get url, Static::MasteryRepresenter.new(Static::Mastery.new)
  end

  ##
  # Retrieves info for all runes.
  #
  # @param locale [String] The locale to use for rune data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for rune data.
  # @param rune_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "basic", "colloq", "consumeOnFull",
  #   "consumed", "depth", "from", "gold", "hideFromAll", "image", "inStore",
  #   "into", "maps", "requiredChampion", "specialRecipe", "stacks", "stats",
  #   and "tags".
  #
  # @return [Hash] The {Static::Rune} objects, where each key is a string
  #   representing the rune's id.
  #
  def static_runes(locale: nil, version: nil, rune_data: nil)
    rune_data = array_options(rune_data).join(',')
    params = params_for(locale: locale, version: version, runeListData: rune_data)
    url = url_for("static-data/#{region}/v1/rune", params)

    get url, Static::RunesRepresenter.new({})
  end

  ##
  # Retrieves info for a specific rune.
  #
  # @param rune_id [Fixnum] The rune's ID.
  # @param locale [String] The locale to use for rune data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for rune data.
  # @param rune_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "image", "prereq", "ranks", and "tree".
  #
  # @return [Static::Rune] The rune's data.
  #
  def static_rune(rune_id, locale: nil, version: nil, rune_data: nil)
    rune_data = array_options(rune_data).join(',')
    params = params_for(locale: locale, version: version, runeData: rune_data)
    url = url_for("static-data/#{region}/v1/rune/#{rune_id}", params)

    get url, Static::RuneRepresenter.new(Static::Rune.new)
  end

  ##
  # Retrieves info for all summoner spells.
  #
  # @param locale [String] The locale to use for spell data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for spell data.
  # @param spell_data [String, Array] The data to include in the response.
  #   Allowed values include: "all", "tooltip", "leveltip", "image",
  #   "resource", "maxrank", "cost", "costType", "costBurn", "cooldown",
  #   "cooldownBurn", "effect", "effectBurn", "vars", "range", "rangeBurn",
  #   "key", and "modes".
  #
  # @return [Hash] The {Static::SummonerSpell} objects, where each key is a string
  #   representing the spell's id.
  #
  def static_spells(locale: nil, version: nil, spell_data: nil)
    spell_data = array_options(spell_data).join(',')
    params = params_for(locale: locale, version: version, spellData: spell_data)
    url = url_for("static-data/#{region}/v1/summoner-spell", params)

    get url, Static::SummonerSpellsRepresenter.new({})
  end

  ##
  # Retrieves info for a specific summoner spell.
  #
  # @param spell_id [Fixnum] The spell's ID.
  # @param locale [String] The locale to use for spell data (e.g.: "en_US"
  #   or "es_ES").
  # @param version [String] The version to use for spell data.
  # @param spell_data [String, Array] The data to include in the response.
  #
  # @return [Static::SummonerSpell] The spell's data.
  #
  def static_spell(spell_id, locale: nil, version: nil, spell_data: nil)
    spell_data = array_options(spell_data).join(',')
    params = params_for(locale: locale, version: version, spellData: spell_data)
    url = url_for("static-data/#{region}/v1/summoner-spell/#{spell_id}", params)

    get url, Static::SummonerSpellRepresenter.new(Static::SummonerSpell.new)
  end

  private

  attr_reader :api_key

  ##
  # Generates the request URL for an endpoint.
  #
  def url_for(path, params = {})
    url = "https://prod.api.pvp.net/api/lol/#{path}"

    query = params.merge(api_key: api_key)
    query = query.map { |k,v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')
    query = nil if query.empty?

    [url, query].compact.join('?')
  end

  ##
  # Builds a hash of parameters, removing parameters with empty values.
  #
  def params_for(params = {})
    params.select { |_, v| !v.nil? }
  end

  ##
  # Performs a GET request, mapping the response to the appropriate object.
  #
  def get(url, representer)
    response = begin
                 RestClient.get(url).body
               rescue RestClient::Exception => e
                 raise RequestError, e.message
               end

    representer.from_json(response)
  end

  ##
  # Converts an array into a comma-delimited string.
  #
  def array_options(values)
    [*values].join(',').split(',').map(&:strip).reject(&:empty?).compact
  end

  ##
  # General error class for all API requests.
  #
  class RequestError < StandardError
  end
end
