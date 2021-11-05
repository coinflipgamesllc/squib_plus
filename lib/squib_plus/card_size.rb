# frozen_string_literal: true

module Squib
  # Default card sizes for use like
  #   Squib::Deck.new(**Squib.card_size(:bridge))
  #
  # Note that each of these has 0.25in extra compared
  # to the real-world dimensions of the card in order
  # to account for bleed.
  @@card_sizes = {
    bridge: { width: '2.5in', height: '3.75in' },
    business: { width: '2.25in', height: '3.75in' },
    divider: { width: '3.25in', height: '3.75in' },
    domino: { width: '2in', height: '3.75in' },
    euro_poker: { width: '2.73in', height: '3.71in' },
    euro_square: { width: '3.01in', height: '3.01in' },
    jumbo: { width: '3.75in', height: '5.75in' },
    micro: { width: '1.5in', height: '2in' },
    mini: { width: '2in', height: '2.75in' },
    poker: { width: '2.75in', height: '3.75in' },
    mint_tin: { width: '2.3in', height: '3.71in' },
    small_square: { width: '2.75in', height: '2.75in' },
    square: { width: '3.75in', height: '3.75in' },
    tarot: { width: '2.75in', height: '5in' },
    us_game: { width: '2.45in', height: '3.68in' }
  }

  def card_size(name, landscape: false)
    dimensions = @@card_sizes.fetch name
    dimensions = { width: dimensions[:height], height: dimensions[:width] } if landscape

    { dpi: 300 }.merge dimensions
  end
  module_function :card_size
end
