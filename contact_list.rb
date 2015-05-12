require_relative 'contact'
require_relative 'contact_database'





# input = gets.chomp

case ARGV[0]

  when 'help'
    
    puts "create: to add user"
    puts "find: to find people"
    puts "show: to display all users"
    puts "all: same thing?"


  when 'create'

    puts "Enter name"
    @name = STDIN.gets.chomp 
    puts "Enter email"
    @email = STDIN.gets.chomp
    Contact.create(@name, @email)

  when 'show'



  when "all"

    puts @contact_arr

  when 'find'

end




