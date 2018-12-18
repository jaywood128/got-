require 'pry'
require 'httparty'
class Got::Scraper
  extend Got

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.get_books
    # @get_books ||= begin
    #   response    = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    #   binding.pry
    #   total_pages = get_page_count(response)
    #
    #   get_all_records('books', response.parsed_response, total_pages)
    binding.pry
    response = self.class.get('{#BASE_ENDPOINT}/api/books')

    end
end
