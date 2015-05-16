require_relative 'contact'
require 'byebug'




Contact.create(first_name: "Pepe", last_name: "Cortisona", email: "piki@gmail.com")

@contact1 = Contact.find(1)

@contact1.phones.create(phone_number: "2505551234")




case ARGV[0]

  when 'help'

    puts "new: to add user"
    puts "find: to find people by index"
    puts "show: to display all users"
    puts "list: by id?"


  when 'new'

    puts "Enter name"
    @first_name = STDIN.gets.chomp
    puts "Enter last name"
    @last_name = STDIN.gets.chomp
    puts "Enter email"
    @email = STDIN.gets.chomp
    puts "Enter phone number"
    @phone_number = STDIN.gets.chomp
    Contact.create(@first_name, @last_name, @email , @phone_number)

  when 'find' 

    puts "Select which way you want to find"
    puts "first name, last name, email, phone number or delete"

    @find = STDIN.gets.chomp
    
    if @find == 'first name'
      puts "please enter name"
      @name = STDIN.gets.chomp
      Contact.find_all_by_firstname(@name)
    elsif @find == 'last name'
      puts "please enter last name"
      @last = STDIN.gets.chomp
      Contact.find_all_by_lastname(@last)
    elsif @find == 'phone number'
      puts "please enter phone number"
      @number = STDIN.gets.chomp
      Contact.find_all_by_number(@number)
    elsif @find == 'email'
      puts "please enter email"
      @email = STDIN.gets.chomp
      Contact.find_by_email(@email)
    else      
      puts "not sure what you mean by that"
    end     


  when 'show'

    puts "Enter ID"
    id = STDIN.gets.chomp 
    Contact.show(id)

  when 'list'
  
    Contact.list

end




