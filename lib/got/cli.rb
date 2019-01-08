#our CLI Controller
class Got::CLI

  def call
     Got::API.create_all_books
     Got::API.list_books
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."


    DOC

    Got::CLI.start

  end

  def self.start
     puts "To see all the books, type list"

     input = gets.strip
     if input == "list"


     end
  end


end
