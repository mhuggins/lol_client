shared_examples_for 'a static champion' do
  it 'is a champion' do
    expect(champion).to be_a LolClient::Static::Champion
  end

  it 'includes all champion data' do
    expect(champion.id).to eq 'Annie'
    expect(champion.name).to eq 'Annie'
    expect(champion.ally_tips).to be_an_array_of String
    expect(champion.blurb).to be_a String
    expect(champion.enemy_tips).to be_an_array_of String
    expect(champion.image).to be_a LolClient::Static::Image
    expect(champion.info).to be_a LolClient::Static::Info
    expect(champion.key).to be_a String
    expect(champion.lore).to be_a String
    expect(champion.par_type).to be_a String
    expect(champion.passive).to be_a LolClient::Static::Passive
    expect(champion.recommended).to be_an_array_of LolClient::Static::Recommended
    expect(champion.skins).to be_an_array_of LolClient::Static::Skin
    expect(champion.spells).to be_an_array_of LolClient::Static::ChampionSpell
    expect(champion.stats).to be_a LolClient::Static::ChampionStats
    expect(champion.tags).to be_an_array_of String
    expect(champion.title).to be_a String
  end
end

shared_examples_for 'a static summoner spell' do
  it 'is a summoner spell' do
    expect(spell).to be_a LolClient::Static::SummonerSpell
  end

  it 'includes all summoner spell data' do
    expect(spell.id).to eq 'SummonerBarrier'
    expect(spell.name).to eq 'Barrier'
    expect(spell.cooldown).to eq [0]
    expect(spell.cooldown_burn).to eq '0'
    expect(spell.cost).to eq [0]
    expect(spell.cost_burn).to eq '0'
    expect(spell.cost_type).to eq 'NoCost'
    expect(spell.description).to eq 'Shields your champion for 115-455 (depending on champion level) for 2 seconds.'
    expect(spell.effect).to be_nil
    expect(spell.effect_burn).to be_nil
    expect(spell.image).to be_a LolClient::Static::Image
    expect(spell.key).to eq '21'
    expect(spell.level_tip).to be_nil
    expect(spell.max_rank).to eq 1
    expect(spell.modes).to eq %w[ARAM CLASSIC TUTORIAL ODIN]
    expect(spell.range).to eq 'self'
    expect(spell.range_burn).to eq 'self'
    expect(spell.resource).to eq 'No Cost'
    expect(spell.summoner_level).to eq 6
    expect(spell.tool_tip).to eq 'Temporarily shields {{ f1 }} damage from your champion for 2 seconds.'
    expect(spell.vars).to be_an_array_of LolClient::Static::SpellVars
  end
end

shared_examples_for 'a static item' do
  it 'is an item' do
    expect(item).to be_a LolClient::Static::Item
  end

  it 'includes all item data' do
    expect(item.colloq).to eq ';'
    #expect(item.consume_on_full).to be_false
    expect(item.consumed).to be_true
    #expect(item.depth).to eq 'hi'
    expect(item.description).to eq '<consumable>Click to Consume:</consumable> Restores 80 Health and 50 Mana over 10 seconds.'
    #expect(item.from).to eq 'hi'
    expect(item.gold).to be_a LolClient::Static::Gold
    #expect(item.group).to eq 'hi'
    #expect(item.hide_from_all).to be_false
    expect(item.image).to be_a LolClient::Static::Image
    #expect(item.in_store).to eq 'hi'
    #expect(item.into).to eq 'hi'
    #expect(item.maps).to eq 'hi'
    expect(item.name).to eq 'Total Biscuit of Rejuvenation'
    #expect(item.plain_text).to eq 'hi'
    #expect(item.required_champion).to eq 'hi'
    #expect(item.rune).to eq 'hi'
    #expect(item.special_recipe).to eq 'hi'
    #expect(item.stacks).to eq 'hi'
    expect(item.stats).to be_a LolClient::Static::BasicDataStats
    #expect(item.tags).to eq 'hi'
  end
end

shared_examples_for 'a static mastery' do
  it 'is an mastery' do
    expect(mastery).to be_a LolClient::Static::Mastery
  end

  it 'includes all mastery data' do
    expect(mastery.id).to eq 4353
    expect(mastery.name).to eq 'Intelligence'
    expect(mastery.description).to eq [
        '+2% Cooldown Reduction and reduces the cooldown of Activated Items by 4%',
        '+3.5% Cooldown Reduction and reduces the cooldown of Activated Items by 7%',
        '+5% Cooldown Reduction and reduces the cooldown of Activated Items by 10%',
    ]
    expect(mastery.image).to be_a LolClient::Static::Image
    expect(mastery.prerequisite).to eq '0'
    expect(mastery.ranks).to eq 3
  end
end

shared_examples_for 'a static rune' do
  it 'is an rune' do
    expect(rune).to be_a LolClient::Static::Rune
  end

  it 'includes all rune data' do
    #expect(rune.colloq).to eq 'hi'
    #expect(rune.consume_on_full).to be_false
    #expect(rune.consumed).to eq be_false
    #expect(rune.depth).to eq 'hi'
    expect(rune.description).to eq '+3.85 ability power'
    #expect(rune.from).to eq 'hi'
    #expect(rune.gold).to eq 'hi'
    #expect(rune.group).to eq 'hi'
    #expect(rune.hide_from_all).to eq be_false
    expect(rune.image).to be_a LolClient::Static::Image
    #expect(rune.in_store).to eq be_false
    #expect(rune.into).to eq 'hi'
    #expect(rune.maps).to be_a_hash_of String
    expect(rune.name).to eq 'Quintessence of Ability Power'
    #expect(rune.plain_text).to eq 'hi'
    #expect(rune.required_champion).to eq 'hi'
    expect(rune.rune).to be_a LolClient::Static::MetaData
    #expect(rune.special_recipe).to eq 'hi'
    #expect(rune.stacks).to eq 'hi'
    expect(rune.stats).to be_a LolClient::Static::BasicDataStats
    expect(rune.tags).to eq %w[magic flat quintessence]
  end
end
