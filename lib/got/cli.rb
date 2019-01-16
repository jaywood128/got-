class Got::CLI

  def call
     Got::API.create_books
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."


    DOC

    Got::CLI.start

  end

  def self.print_all_books

    Got::Book.all.each.with_index(1) do |book, i| #value, index
      puts "Name:#{i} #{book.title}"
    end
    puts "Enter book number for more info: "
    book_number = gets.strip.to_i
    if (1..12).include?(book_number)
      book = Got::Book.all[book_number - 1]
      print_details_for_book(book)
    elsif book_number == 'exit'
      exit
    else
      "Not found, try again: "
      print_all_books
    end


  end

  def self.print_details_for_book(book)
    puts "Author: #{book.author}"
    puts "Number of pages: #{book.number_of_pages}"
    puts "Point of View Characters: "
    book.characters.each do |char|
      puts "Name: #{char.name}"
    end
    puts " \n\n "


  end

  def self.start
     puts "These are your options, type them as is: "
     puts "print all books"
     puts "print book's characters and details"
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
          puts "Character found! Type 'Y' for more info, otherwise type 'N'"
            y_or_n = gets.strip
              if y_or_n == 'Y'
                puts character.details
              elsif y_or_n == 'N'
                "Enter another command: "
                another_command = gets.strip
                if another_command == "find character by name"
                  character_name = gets.strip
                  character = find_character_by_name(character_name)
                elsif another_command == "print all books"
                  print_all_books
                else
                    exit
                end
              end
           # puts character.details #create an instance method in Character.rb that accesses the character details
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
