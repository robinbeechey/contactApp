require_relative 'contact'
require_relative 'contact_database'


case ARGV[0]
  when "new"
    puts "Enter name" 
    @name = STDIN.gets.chomp   
    puts "Enter email"
    @email = STDIN.gets.chomp
    Contact.create(@name, @email)
  when "all"
    puts "all"
  when "show"
    puts "showing by id"
  when "find"
    puts "showing by id"
  when "help"
    puts "Here are your choices\nNew - Add contact\nAll - Display all\nShow [id] - Show contact\nFind [id] - Same as show"
end