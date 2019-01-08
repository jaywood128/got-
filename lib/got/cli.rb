class Got::CLI

  def call
     Got::API.create_all_books
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."


    DOC

    Got::CLI.start

  end

  def self.print_all_books

    Got::Book.all.each do |book|
      puts book.title
      puts book.author
      puts book.number_of_pages
      puts "Point of View Characters: "
      book.charactersobjects.each do |char|
        puts char.name
      end
      puts " \n\n        "
    end


  end

  def self.start
     puts "To see all the books, type list"

     input = gets.strip
     if input == "list"
       print_all_books



     end
  end


end
