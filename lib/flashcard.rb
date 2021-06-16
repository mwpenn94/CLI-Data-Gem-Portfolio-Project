# frozen_string_literal: true
require 'bundler/setup'
require 'byebug'
require 'pry'
require 'nokogiri'
require 'open-uri'
#Bundler.require(:default)

require_relative "flashcard/version"
require_relative "flashcard/cli"
require_relative "flashcard/lesson"
require_relative "flashcard/scraper"

module Flashcard
  class Error < StandardError; end
  # Your code goes here...
end
