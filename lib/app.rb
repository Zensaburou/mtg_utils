class App
  def initialize(set_names, deck_file)
    @set_library = SetLibrary.new(set_names)
    @card_array = generate_card_array(deck_file)
  end

  def display_mana_curve
    cmc_hash = generate_cmc_hash
    cmc_hash.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

  def generate_cmc_hash
    cmc_hash = {}

    11.times do |cmc|
      cmc_hash[cmc.to_s] = count_cards_with_cmc(cmc)
    end

    cmc_hash
  end

  private

  def generate_card_array(deck_file)
    simple_card_array = DeckFileInterface.new.parse_deck_file(deck_file)
    fetch_info_for_all_cards(simple_card_array)
  end

  def fetch_info_for_all_cards(simple_card_array)
    simple_card_array.map { |card_hash| generate_complete_card_info_hash(card_hash) }
  end

  def generate_complete_card_info_hash(simple_card_hash)
    full_card_info = find_card_info(simple_card_hash)
    { copies: simple_card_hash[:copies] }.merge(full_card_info)
  end

  def find_card_info(simple_card_hash)
    @set_library.card_array.find { |card| card['name'] == simple_card_hash[:name] }
  end

  def count_cards_with_cmc(cmc)
    matching_cards = @card_array.select { |card_hash| card_hash['cmc'].to_i == cmc }
    matching_cards.inject(0) { |sum, card_hash| sum + card_hash[:copies].to_i }
  end
end
