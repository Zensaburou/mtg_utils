require 'json'
require 'net/http'

class SetLibrary
  def initialize(set_names)
    @set_json_array = retrieve_json_for_all_sets(set_names)
  end

  def retrieve_json_for_all_sets(set_names)
    sets = set_names.split(',')
    sets.map { |set| retrieve_set_json(set) }
  end

  def retrieve_set_json(set_name)
    uri = URI("https://mtgjson.com/json/#{set_name}.json")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def card_array
    card_array = []
    @set_json_array.each { |set| card_array += set['cards'] }
    card_array
  end
end
