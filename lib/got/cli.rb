class Got::CLI

  def call
     Got::API.create_books
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."


    DOC

    Got::CLI.start

  end

  def self.print_all_books

    Got::Book.all.each do |book|
      puts "Name: #{book.title}"
      puts "Author: #{book.author}"
      puts "Number of pages: #{book.number_of_pages}"

      book.charactersobjects.each do |char|
      puts "Point of View Characters: "
        puts "Name: #{char.name}"
      end
      puts " \n\n        "
    end


  end

  def self.start
     puts "These are your options, type them as is: "
     puts "print all books"
     puts "find character by name"

     input = gets.strip
     if input == "print all books"
       print_all_books
     elsif input == "find character by name"
       input = gets.strip
       Got::API.find_character_by_name(input)
    else
      exit

     end
  end


end
