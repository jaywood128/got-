class Got::Character

  attr_reader :url, :name, :gender, :culture, :born, :died, :allegiances, :books, :tv_series, :played_by

@@all = {}
 def initialize(hash)
  @url = hash['url']
  @name = hash['name']
  @gender = hash['gender']
  @culture = hash['']
  @born = hash['born']
  @died = hash['died']
  @allegiances = hash['allegiances']
  @books = hash['books']
  @tv_Series = hash['tvSeries']
  @played_By = hash["playedBy"]
  @@all[@url] = self # @url is the key and self is the value. The value is the Character object iself and every character is accessible via the url.
 end

 def self.find_by_url(url)
   @@all[url]

 end

 def books_featured_in

 end



end