# frozen_string_literal: true

require 'combine_pdf'

module Squib
  # Merge PDFs together, collated for front/back printing
  # Example:
  #   # Deck front
  #   Squib::Deck.new(cards: deck['name'].size) do
  #     ...

  #     pnp file: 'front.pdf'
  #   end

  #   # Deck back
  #   Squib::Deck.new(cards: deck['name'].size) do
  #     ...

  #     pnp file: 'back.pdf'
  #   end

  #   # Combine PnP
  #   Squib.combine_pdfs([
  #     { :front => "_output/front.pdf", :back => "_output/back.pdf" },
  #   ], "_output/pnp.pdf")
  def combine_pdfs(sheets, file)
    pdf = CombinePDF.new

    sheets.each do |sheet|
      front = CombinePDF.load(sheet[:front])

      # Collate the back pages immediately after the relevant page,
      # if a back-side is provided.
      back = CombinePDF.load(sheet[:back]) if sheet.key?(:back)

      i = 0
      front.pages.each do |page|
        pdf << page
        pdf << back.pages[i] if sheet.key?(:back)

        break if i == front.pages.count - 1

        i += 1
      end
    end

    pdf.save file
  end
  module_function :combine_pdfs
end
