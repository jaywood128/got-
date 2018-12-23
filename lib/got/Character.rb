class Got::Character

  attr_reader :url, :name, :gender, :culture, :born, :died, :allegiances, :books, :tv_series, :played_by

@@all = []
 def initialize(url)
  @url = url['url']
  @name = url['name']
  @gender = url['gender']
  @culture = url['']
  @born = url['born']
  @died = url['died']
  @allegiances = url['allegiances']
  @books = url['books']
  @tv_Series = url['tvSeries']
  @played_By = url["playedBy"]
  @@all << self
  binding.pry
 end

 def books_featured_in

 end



end
