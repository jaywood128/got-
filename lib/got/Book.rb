require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json
  attr_accessor :characters
  attr_reader :title, :isbn, :author, :numberOfPages, :publisher, :country, :media_type, :character_urls
@@all = []
 def initialize(hash)
   @title = hash[:title]
   @author = hash[:author]
   @number_of_pages = hash[:number_of_pages]
   @character_urls = hash[:character_urls][1..20]
   @characters = []
   @@all << self

 end
 def self.all
   @@all
 end

end
