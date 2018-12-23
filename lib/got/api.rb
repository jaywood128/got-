require 'pry'
require 'httparty'
class Got::API

  include HTTParty
  format :json

  BASE_ENDPOINT  = "http://anapioficeandfire.com/api".freeze

  WORD_PARTICLES = %w(and or the over to the a but of for with).freeze

  def self.collect_all_books
    response = get("#{BASE_ENDPOINT}/books?page=1&pageSize=50")

    response.map do |book|
      book_hash =  {:title => book['name'],
      :author => book['authors'][0],
      :number_of_pages => book['numberOfPages'],
      :character_urls => book['characters']#.map { |url| url.split("/").last.to_i}
        }
      y = Got::Book.new(book_hash)
    end
      y.character_urls.each do |character_url|
          #ter Character URL for specific character_urls
        # Method takes a character URL, return a character object
        y.characters << create_characters(character_url)
      end
binding #Book.all.each |book| do  book.characters

  end

  def self.create_characters(url)    #Blog refactoring creating a Character instance using a call-back
    data = get(url)
    character = Character.new(data)
  end

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
  # def self.get_more_info
  #   book = get("http://anapioficeandfire.com/api/books")
  #   book.map do |book|
  #          info =  {:isbn => book['isbn'],
  #                    :authors => book['authors'],
  #                    :number_of_pages => book['numberOfPages'],
  #                    :publisher => book['publisher']
  #                  }
  #
  #          end
  # end
end
