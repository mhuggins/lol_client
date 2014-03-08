RSpec::Matchers.define :be_an_array_of do |expected|
  match do |actual|
    actual.is_a?(Array) && actual.map(&:class).uniq == [expected]
  end
end

RSpec::Matchers.define :be_a_hash_of do |expected|
  match do |actual|
    actual.is_a?(Hash) && actual.values.map(&:class).uniq == [expected]
  end
end
