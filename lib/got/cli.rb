#our CLI Controller
class Got::CLI

  def call
    puts <<-DOC "Welcome to the fictional realm of Westeros! Learn more about the popular novels that inspired the TV show, Game of Thrones."
    DOC
    list_books
    menu
    list_characters
  end

  def menu
     puts "Enter the book you want more info on. For exiting, type exit and to see the books again list_books: "
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
    all_the_books = get("#{BASE_ENDPOINT}/books")
    all_the_books.map do |book|
   puts "Book #{book['url'].split.map {|url| url.split("/").last.to_i}} : #{book['name']}."

  end

  def list_characters

  end
end
