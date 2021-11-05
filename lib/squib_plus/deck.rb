# frozen_string_literal: true

module Squib
  class Deck
    # Adds a card number to the bottom right of the card by default.
    # Helps with tracking down a specific card in your spreadsheet in
    # games with many unique cards.
    def card_num(opts = {})
      defaults = {
        x: width - 100,
        y: height - 100,
        width: 50,
        height: 50,
        font: 'sans-serif',
        font_size: 9,
        color: '#000',
        align: :center,
        valign: :middle
      }
      range = Args.extract_range opts, self

      # Index from 1
      text(str: range.map { |i| i + 1 }, **(defaults.merge opts))
    end

    # Shortcut for save_sheet with defaults that make sense for Tabletop Simulator
    def tts(opts = {})
      defaults = { columns: 10, rows: 7, trim: 37.5 }
      save_sheet(defaults.merge(opts))
    end

    # Shortcut for creating a Print-n-Play sheet using poker-sized cards
    def pnp(opts = {})
      cut_zone stroke_color: '#888'
      defaults = {
        trim: 37.5,
        sprue: if opts[:rtl]
                 "#{File.dirname(__FILE__)}/sprues/letter_poker_tight_reverse.yml"
               else
                 "#{File.dirname(__FILE__)}/sprues/letter_poker_tight.yml"
               end
      }
      save_pdf(defaults.merge(opts))
    end
  end

  require_relative 'deck/avatar'
end
