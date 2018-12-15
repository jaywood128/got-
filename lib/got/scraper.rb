class Got::Scraper

  def scrap
    game_of_thrones_api = Nokogiri::HTML(open('https://anapioficeandfire.com/'))
    binding.pry

  end




end
