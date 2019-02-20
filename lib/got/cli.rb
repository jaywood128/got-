class Got::CLI

  def call
    Got::API.create_books
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."
    DOC

    Got::CLI.start
  end
  def self.start
    input = nil
    while input != "exit"
      puts "What would you like to do? (type 'menu' to see options again)"
      input = gets.strip
      if input == "print all books"
        print_all_books
      elsif input == "find character by name"
        character_finder
      elsif input == "menu"
        menu
      end
    end
  end
  def self.menu
    puts "These are your options, type them as is: "
    puts "print all books"
    puts "find character by name"
    puts "exit"
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
     puts "Not found, try again: "
     print_all_books
   end
 end
 def self.print_details_for_book(book)
   puts "Author: #{book.author}"
   puts "Number of pages: #{book.number_of_pages}"
   puts "Point of View Characters: "
   book.characters.each.with_index do |char, i|
     puts "#{i + 1}. #{char.name}"
   end
   puts " \n\n "
   puts "Total number of POV characters: #{book.characters.count}"

   char_number = gets.strip.to_i
   if (1..book.characters.count).include?(char_number)
     puts book.characters[char_number - 1].details
   end
 end

  def self.character_finder
    puts "Enter the name of the character you want more info on: "
    character_name = gets.strip
    character = Got::Character.find_by_name(character_name)
    if character
      puts character.details
      # puts character.details #create an instance method in Character.rb that accesses the character details
    else
      puts "not found"
    end
  end
end
