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
      puts "Point of View Characters: "
      book.charactersobjects.each do |char|
        puts "Name: #{char.name}"
      end
      puts " \n\n        "
    end


  end

  def self.start
     puts "These are your options, type them as is: "
     puts "print all books"
     puts "find character by name"
     puts "exit"

     input = gets.strip
     while input != "exit"
       if input == "print all books"
         print_all_books
         print "Enter another command: "
         input = gets.strip
       elsif input == "find character by name"
         character_name = gets.strip
         character = Got::API.find_character_by_name(character_name)
        if character != false
          puts character.details #create an instance method in Character.rb that accesses the character details
          puts "found"
          puts "URL: #{result.url}"
          puts "#{result.name}"
          puts "Gender: #{result.gender}"
          puts "Culture: #{result.culture}"
          puts "Date of Birth: #{result.born}"
          puts "Died: #{result.died}"
          puts "Allegiance: #{result.allegiances}"
          # puts "Books featured in: #{result.books}"
          puts "TV Series: #{result.tv_series}"
          puts "Played by: #{result.played_by}"


        else
          puts "not found"
          # character not found
          # ask for input again
          # input find character by name
          # Got::API.find_character_by_name(character_name
        end
          # Return a character object or nil
         input = gets.strip
       elsif input == "exit"
         exit
      else
        "Invalid response!"
        input = gets.strip
       end
     end
  end

end
