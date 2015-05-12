require_relative 'contact'
require 'csv'


case ARGV[0]

  when 'help'

    puts "create: to add user"
    puts "find: to find people by index"
    puts "show: to display all users"
    puts "list: by id?"


  when 'create'

    puts "Enter name"
    @name = STDIN.gets.chomp
    puts "Enter email"
    @email = STDIN.gets.chomp
    Contact.create(@name, @email)

  when 'show'

    

  when 'list'

    Contact.all

  when 'find'

end




