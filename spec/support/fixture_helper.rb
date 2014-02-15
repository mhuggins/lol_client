def load_fixture(filepath)
  File.read("spec/fixtures/#{filepath}")
end

def load_json_fixture(filename)
  load_fixture("json/#{filename}.json")
end
