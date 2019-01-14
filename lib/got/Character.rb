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

  def details

     puts "found"
     puts "URL: #{self.url}"
     puts "#{self.name}"
     puts "Gender: #{self.gender}"
     puts "Culture: #{self.culture}"
     puts "Date of Birth: #{self.born}"
     puts "Died: #{self.died}"
     puts "Allegiance: #{self.allegiances}"
     # puts "Books featured in: #{result.books}"
     puts "TV Series: #{self.tv_series}"
     puts "Played by: #{self.played_by}"

   end
end
