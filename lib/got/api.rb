require 'pry'
require 'httparty'
class Got::API

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.collect_all_books
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    response.map do |book|
      book_hash =  {:title => book['name'],
        :author => book['authors'][0],
      :number_of_pages => book['numberOfPages']
      # :character_ids => book['characters'].map { |url| url.split("/").last.to_i}
        }

        Got::Book.new(book_hash)
    # all_the_books = get("#{BASE_ENDPOINT}/books")
    # all_the_books.map do |book|
    #   puts "Book #{book['url'].split.map {|url| url.split("/").last.to_i}} : #{book['name']}."

  end
end

  def self.collect_character_ids
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
    response.map do |book|
      character_hash =  {
                    :character_ids => book['characters'].map { |url| url.split("/").last.to_i}
                  }

    end
  end

  def self.collect_character_numbers
       Got::API.collect_character_ids.map do |arr|
         arr[:character_ids].map |number|

         binding.pry
        get("https://anapioficeandfire.com/api/characters/#{number}")
      end
    end
  end

  def self.get_more_info
    book = get("http://anapioficeandfire.com/api/books")
    book.map do |book|
           info =  {:isbn => book['isbn'],
                     :authors => book['authors'],
                     :number_of_pages => book['numberOfPages'],
                     :publisher => book['publisher']
                   }

           end
  end
end
