require 'pry'
require 'httparty'
class Got::Scraper


  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.get_books
    
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    response.map do |book|
        {:title => book['name'],
        :author => book['authors'][0],
      :number_of_pages => book['numberOfPages'] }
    end    
      

    end
end