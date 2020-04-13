require 'json'

# Initializers
%w[dry_struct kafka].each { |config| require_relative "initializers/#{config}.rb" }

# Models
%w[order].each { |model| require "./app/models/#{model}.rb" }

# Producers
%w[order].each { |producer| require "./app/producers/#{producer}_producer.rb" }