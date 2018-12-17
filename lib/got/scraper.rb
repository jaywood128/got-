require 'pry'
require_relative 'httparty'
class Got::Scraper

  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def scrap
    binding.pry
    BASE_ENDPOINT

  end


end
