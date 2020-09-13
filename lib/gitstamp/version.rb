# This is free and unencumbered software released into the public domain.

module Gitstamp
  module VERSION
    FILE = File.expand_path('../../VERSION', __dir__).freeze
    STRING = File.read(FILE).chomp.freeze
    MAJOR, MINOR, PATCH, EXTRA = STRING.split('.').map(&:to_i).freeze

    ##
    # @return [String]
    def self.to_s() STRING end

    ##
    # @return [String]
    def self.to_str() STRING end

    ##
    # @return [Array(Integer, Integer, Integer)]
    def self.to_a() [MAJOR, MINOR, PATCH].freeze end
  end # VERSION
end # Gitstamp
