class DeckFileInterface
  def parse_deck_file(deck_file)
    File.readlines(deck_file).map { |line| parse_deck_line(line) }
  end

  def parse_deck_line(line)
    partitioned_line = line.partition(' ')
    {
      copies: partitioned_line[0],
      name: partitioned_line[2].strip
    }
  end
end
