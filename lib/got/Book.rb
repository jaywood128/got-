require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json
  attr_accessor :charactersobjects
  attr_reader :title, :isbn, :author, :number_of_pages, :publisher, :country, :media_type, :character_urls
@@all = []
 def initialize(hash)
   @title = hash[:title]
   @author = hash[:author]
   @number_of_pages = hash[:number_of_pages]
   @character_urls = hash[:character_urls]
   @characters = []
   @@all << self

 end
 def self.all
   @@all
 end

 def print_books_characters
   Got::Book.all.each do |book|
     book.characters
  end
 end

end
