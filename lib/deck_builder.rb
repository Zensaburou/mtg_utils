require 'roo'

class DeckBuilder
  #def initialize(sets, card_list_file)
    #@card_hash_array = DeckFileInterface.new.parse_deck_file(card_list_file)
  def initialize(sets)
    @sets = sets
  end

  def build_deck
    sorted_hash_array = sort_by_efficiency(@card_hash_array)
    output_deck_list(top_cards)
  end

  def sort_by_efficiency(card_hash_array)
  end

  def parse_card_stats_file
    set_list = @sets.split(',')
    stats_file = Roo::Spreadsheet.open('../data/ratings.xlsx')
    puts stats_file.sheets
  end

  def output_deck_list(top_cards)
    sorted_hash_array.each { |card_hash| puts card_hash[:name] }
  end
end
