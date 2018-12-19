require 'pry'
require 'httparty'
class Got::Book
  include HTTParty
  format :json

  attr_reader :title, :isbn, :author, :numberOfPages, :publisher, :country, :media_type, :characters

 def initialize

 end

  def self.create_from_collection
    API.get_books


  end

end
