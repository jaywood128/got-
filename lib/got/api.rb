require 'pry'
require 'httparty'
class Got::API

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.get_books
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    response.map do |book|
      book_hash =  {:title => book['name'],
        :author => book['authors'][0],
      :number_of_pages => book['numberOfPages'],
      :character_ids => book['characters'].map { |url| url.split("/").last.to_i}
        }

      Got::Book.new(book_hash[:title], book_hash[:author], book_hash[:number_of_pages], book_hash[:character_ids])
      binding.pry
  end

  end
end
