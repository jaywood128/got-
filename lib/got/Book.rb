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

 def self.search_by_character_name(name)
     self.all.each do |book|
      book[:character_ids].map do |url|
       get("https://anapioficeandfire.com/api/characters/#{url}")
       binding.pry
     end
   end
 end

end
