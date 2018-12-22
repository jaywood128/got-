require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json

  attr_reader :title, :isbn, :author, :numberOfPages, :publisher, :country, :media_type, :characters
@@all = []
 def initialize(hash)
   @title = hash[:title]
   @author = hash[:author]
   @number_of_pages = hash[:number_of_pages]
   @@all << self
 end
 def self.all
   @@all
 end

 def search_by_character_name(name)
      self.all.each do |book|
      book[:character_ids].map do |url|
       get("https://anapioficeandfire.com/api/characters/#{url}")

     end
   end
 end
end
