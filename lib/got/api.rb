require 'pry'
require 'httparty'
class Got::API

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze


  def self.create_books
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")

    response.each do |res|
      book_hash =  {:title => res['name'],
      :author => res['authors'][0],
      :number_of_pages => res['numberOfPages'],
      :character_urls => res['povCharacters']#.map { |url| url.split("/").last.to_i}
        }
      book = Got::Book.new(book_hash)

    end
    collect_all_characters

end

  def self.collect_all_characters
    Got::Book.all.each do |book|
      book.character_urls.each do |url|
        if !Got::Character.url_exists?(url)
          response = get(url)
          char = Got::Character.new(response)
          char.books << book
          book.characters << char
        else
          Got::Character.find_by_url(url).book_urls << book
        end
      end
    end
  end
end
