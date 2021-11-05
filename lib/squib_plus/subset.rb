# frozen_string_literal: true

module Squib
  # Subset a selection of cards based on some criteria. Can be passed
  # directly into the range argument of other DSL functions.
  #
  # Example:
  #   gems = Squib.subset(deck['category'], -> (c) { c === 'gem' })
  #   text range: gems, str: deck['gem_num'], layout: 'gem_label'
  #
  # You can invert the match using matching: false
  # This allows you to use a single criteria function for positive/negative
  # matches.
  def subset(column, criteria, matching: true)
    sub = {}
    column.each_with_index { |c, i| (sub[criteria.call(c)] ||= []) << i }

    sub[matching]
  end
  module_function :subset
end
