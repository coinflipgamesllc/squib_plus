# frozen_string_literal: true

require 'mechanize'

module Squib
  # gsheet allows you to load Deck data using Google Sheets.
  #
  # First, share your sheet using File > Publish to the web
  # Select 'Entire document' and '.csv' as the format
  # Copy the URL like
  #   https://docs.google.com/spreadsheets/d/e/2PACX-.../pub?output=csv
  #                                            ^^^^^^^^^
  #   The code you need to pass is the long ID after /d/e.
  #
  # If the sheet has multiple tabs, you can specify a later tab using the gid from
  # the non-share URL like
  #   https://docs.google.com/spreadsheets/d/.../edit#gid=123456
  #                                                       ^^^^^^
  #   The gid is at the end of the URL after #gid=
  #
  # Example:
  #   deck = Squib.gsheet('2PACX-...', 123456)
  #
  #   Squib::Deck.new(cards: deck['name'].size) do
  #     ...
  #   end
  #
  # You can optionally specify the tab to use with the second argument
  def gsheet(sheet_id, index = 0)
    agent = Mechanize.new
    response = agent.get_file("https://docs.google.com/spreadsheets/d/e/#{sheet_id}/pub?gid=#{index}&output=csv")
    response = response.encode('ascii-8bit').force_encoding('utf-8')

    Squib.csv data: response
  end
  module_function :gsheet
end
