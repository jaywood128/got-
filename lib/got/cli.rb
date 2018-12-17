#our CLI Controller
class Got::CLI

  def call
    puts <<-DOC "Welcome to The Game of Thrones API with the Maester of the Night's Watch, Maester Aemon!"
    These are the books.
    DOC
    list_books
    menu
    list_characters
  end

  def menu
    puts "Enter the book you want more info on. For exiting, type 'exit' and to see the books again 'list_books':"
    input = nil
    while input != 'exit'

      input = gets.strip
      case input
      when 'book1'
          puts "more info on book1"
      when 'book2'
          puts "More book2"
      when 'book3'
          puts "more info book3"
      when 'book4'
          puts "more info book4"
      when 'book5'
        puts "more info book5"
      when 'list_books'
        list_books
    else
      puts "Invalid input"
    end

  end
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
