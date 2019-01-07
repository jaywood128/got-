#our CLI Controller
class Got::CLI

  def call
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."


    DOC

    Got::CLI.start

  end

  def self.start
     puts "To see all the books, type list"

     input = gets.strip
     if input == "list"
       Got::API.collect_all_books

     end
  end


end
