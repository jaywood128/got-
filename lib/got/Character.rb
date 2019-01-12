class Got::Character
  attr_accessor :booksobjects
  attr_reader :url, :name, :gender, :culture, :born, :died, :allegiances, :books, :tv_series, :played_by

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
  @books = hash['books']   # Book URLS
  @booksobjects = []
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

 def details

   @@characters.each do |character|
     puts "found"
     puts "URL: #{character.url}"
     puts "#{character.name}"
     puts "Gender: #{character.gender}"
     puts "Culture: #{character.culture}"
     puts "Date of Birth: #{character.born}"
     puts "Died: #{character.died}"
     puts "Allegiance: #{character.allegiances}"
     # puts "Books featured in: #{result.books}"
     puts "TV Series: #{character.tv_series}"
     puts "Played by: #{character.played_by}"
  end

 end
end
