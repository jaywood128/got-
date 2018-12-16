#our CLI Controller
class Got::CLI

  def call
    puts <<-DOC "Welcome to The Game of Thrones API with the Maester of the Night's Watch, Maester Aemon!"
    These are the books.
    DOC
    list_books
    menu
  end

  def menu
    puts "Enter the book you want more info on:"


  end

  def list_books
    puts "book1"
    puts "book2"
    puts "book3"
    puts "book4"
    puts "book5"

  end

  def list_characters

  end

  def self.get_title_by_number(num)
    #user inputs a number, the method returns the title of the novel based on the Song of Fire and Ice series.
  end
end
