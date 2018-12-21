require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json

  attr_reader :title, :isbn, :author, :numberOfPages, :publisher, :country, :media_type, :characters
@@all = []
 def initialize(title, author, number_of_pages,character_ids)
   @@all << self
 end

 def self.all
   @@all
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

 def search_by_character_name(name)
      self.all.each do |book|
      book[:character_ids].map do |url|
       get("https://anapioficeandfire.com/api/characters/#{url}")

     end
   end
 end
end
