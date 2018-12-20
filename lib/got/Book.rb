require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json

  attr_reader :title, :isbn, :author, :numberOfPages, :publisher, :country, :media_type, :characters

 def call
   binding.pry
   API.get_books
 end

 def self.search_by_character_name(name)
     self.all.each do |book|
      book[:character_ids].map do |url|
       get("https://anapioficeandfire.com/api/characters/#{url}")
       binding.pry
     end
   end
 end

end
