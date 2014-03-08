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
    expect(champion.spells).to be_an_array_of LolClient::Static::Spell
    expect(champion.stats).to be_a LolClient::Static::Stats
    expect(champion.tags).to be_an_array_of String
    expect(champion.title).to be_a String
  end
end

shared_examples_for 'a static spell' do
  it 'is a spell' do
    expect(spell).to be_a LolClient::Static::Spell
  end

  it 'includes all spell data' do
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
    expect(spell.level_tip).to be_nil
    expect(spell.max_rank).to eq 1
    expect(spell.range).to eq 'self'
    expect(spell.range_burn).to eq 'self'
    expect(spell.resource).to eq 'No Cost'
    expect(spell.tool_tip).to eq 'Temporarily shields {{ f1 }} damage from your champion for 2 seconds.'
    expect(spell.vars).to be_an_array_of LolClient::Static::SpellVars
  end
end
