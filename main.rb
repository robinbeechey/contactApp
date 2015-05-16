require_relative 'setup' 
require_relative 'contact'
require 'byebug'


#add number and relation to it
#add email validation
#add other validation
#add delete, or update modes
#implement errors

case ARGV[0]

  when 'help'

    puts "new: to add user"
    puts "find: to find people by index"
    puts "show: to display all users"
    puts "list: by id?"


  when 'new'

    puts "Enter name"
    first_name = STDIN.gets.chomp
    puts "Enter last name"
    last_name = STDIN.gets.chomp
    puts "Enter email"
    email = STDIN.gets.chomp
    # puts "Enter phone number"
    # @phone_number = STDIN.gets.chomp

    Contact.create(first_name: "#{first_name}", last_name: "#{last_name}", email: "#{email}")
    # @contact1 = Contact.find(1)
    # # @contact1.phones.create(phone_number: "#{@phone_number}")


  when 'find' 

    puts "Select which way you want to find"
    puts "first name, last name, email, phone number or delete"

    find = STDIN.gets.chomp

     #must be exacly typed for now
    
    if find == 'first name'
      puts "please enter name"
      name = STDIN.gets.chomp
      contact = Contact.where(first_name: "#{name}").first
      puts contact
    elsif find == 'last name'
      puts "please enter last name"
      last = STDIN.gets.chomp
      puts Contact.where(last_name: "#{last}").first
    elsif find == 'email'
      puts "please enter email"
      email = STDIN.gets.chomp
      puts Contact.where(email: "#{email}").first
    elsif find == 'phone number'
      puts "please enter phone number"
      number = STDIN.gets.chomp
      puts Contact.where(phone_number: "#{number}").first
    else      
      puts "not sure what you mean by that"
    end     


  when 'show'

    puts "Enter ID"
    id = STDIN.gets.chomp 
    puts Contact.find id

  when 'list'
  
    Contact.all.each do |contact|
      puts contact
    end

end






