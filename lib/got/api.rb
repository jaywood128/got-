require 'pry'
require 'httparty'
class Got::API

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze


  def self.list_books
    all_the_books = get("#{BASE_ENDPOINT}/books")
    all_the_books.map do |book|
   puts "Book #{book['url'].split.map {|url| url.split("/").last.to_i}} : #{book['name']}."

  end
end

def self.create_books
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")

    response.map do |res|
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
def self.find_character_by_name(name)
  return_v = false
  Got::Character.characters.each do |character|
    if character.name == name
      return_v = character
    end
  end
  return_v
end
  # def self.create_character(url)    #Blog refactoring creating a Character instance using a call-back
  #   data = get(url)
  #   character = Character.new(data)
  # end

  # def self.collect_character_ids
  #   response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")
  #   response.map do |book|
  #     character_hash =  {
  #                   :character_ids => book['characters'].map { |url| url.split("/").last.to_i}
  #                 }
  #
  #   end
  # end
#
#   def self.collect_character_numbers
#
#        Got::API.collect_character_ids.map do |arr|
#
#          arr[:character_ids].map do |id|
#         url = get("https://anapioficeandfire.com/api/characters/#{id}")
#
#        Got::Character.new(url)
#
#       end
#     end
# end
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
