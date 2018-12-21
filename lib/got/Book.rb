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

 def get_more_info
   book = get("#{BASE_ENDPOINT}/books")
   book.map do |book|
   <<-DOC isbn: #{book['isbn']}
          authors: #{book['authors']}
          puts number of pages: #{book['numberOfPages']}
          puts publisher: #{book['publisher']}
    DOC
    binding.pry

 end

 def search_by_character_name(name)
      self.all.each do |book|
      book[:character_ids].map do |url|
       get("https://anapioficeandfire.com/api/characters/#{url}")

     end
   end
 end
end
