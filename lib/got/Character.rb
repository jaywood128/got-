class Got::Character
  attr_accessor :booksobjects, :books
  attr_reader :url, :name, :gender, :culture, :born, :died, :allegiances, :book_urls, :tv_series, :played_by

@@all = {}
@@characters = []
 def initialize(hash)
  @url = hash['url']
  @name = hash['name']
  @gender = hash['gender']
  @culture = hash['']
  @born = hash['born']
  @died = hash['died']
  @allegiances = hash['allegiances']
  @book_urls = hash['books']   # Book URLS
  @books = []
  @tv_Series = hash['tvSeries']
  @played_By = hash["playedBy"]
  @@all[@url] = self # @url is the key and self is the value. The value is the Character object iself and every character is accessible via the url.
  @@characters << self # Character object added to an array called characters
 end

 def self.characters
   @@characters
 end

 def self.find_by_url(url)

   @@all[url]
 end

 def self.url_exists?(url)
   @@all.has_key?(url)
 end

 def self.character_name_exists?(name)
   @@all.has_key?(name)
end

 def self.all
   @@all
 end

 def self.find_by_name(name)
  #  return_v = false
  #  Got::Character.characters.each do |character|
  #    if character.name == name
  #      return_v = character
  #    end
  #  end
  #  return_v
  Got::Character.characters.detect {|character| character.name == name }

 end

  def details

      [
        "found",
        "URL: #{self.url}",
        "#{self.name}",
        "Gender: #{self.gender}",
        "Culture: #{self.culture}",
        "Date of Birth: #{self.born}",
        "Died: #{self.died}",
        "Allegiance: #{self.allegiances}",
     # puts "Books featured in: #{result.books}"
        "TV Series: #{self.tv_series}",
        "Played by: #{self.played_by}"
      ]

   end
end
