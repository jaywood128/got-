#our CLI Controller
class Got::CLI

  def call
    puts <<-DOC "Welcome to The Game of Thrones of API with the Maester of the Night's Watch, Maester Aemon!"
    DOC
  end

  def self.get_title_by_number(num)
    #user inputs a number, the method returns the title of the novel based on the Song of Fire and Ice series.
  end
end
