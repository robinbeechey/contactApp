require_relative 'contact_database'
require_relative 'contact'


ContactDatabase

  puts "----------Contact List----------"



  def new_contact
    puts "Enter name"
    first_name = gets.chomp
    puts "Enter last name"
    last_name = gets.chomp
    puts "Enter email"
    email = gets.chomp
    puts "Enter phone number"
    phone_number = gets.chomp

    Contact.create(first_name, last_name, email , phone_number)
  end

  def show

  end

  def list_all
    Contact.list.each do |contact|
      puts contact
    end
  end

  def find

  end


  loop do

  print %q(
Menu

new - create a new contact
list - show all contacts
search - find an contact by last name
update - update contact
find - find by, firstname, lastname, etc.
quit - quit program
  > )
  command = gets.chomp

  case command
    when 'new'
      new_contact
    when 'list'
      list_all 
    # when 'find' 

    #   puts "Select which way you want to find"
    #   puts "first name, last name, email, phone number or delete"

    #   @find = STDIN.gets.chomp
      
    #   if @find == 'first name'
    #     puts "please enter name"
    #     @name = STDIN.gets.chomp
    #     Contact.find_all_by_firstname(@name)
    #   elsif @find == 'last name'
    #     puts "please enter last name"
    #     @last = STDIN.gets.chomp
    #     Contact.find_all_by_lastname(@last)
    #   elsif @find == 'phone number'
    #     puts "please enter phone number"
    #     @number = STDIN.gets.chomp
    #     Contact.find_all_by_number(@number)
    #   elsif @find == 'email'
    #     puts "please enter email"
    #     @email = STDIN.gets.chomp
    #     Contact.find_by_email(@email)
    #   else      
    #     puts "not sure what you mean by that"
    #   end     


    # when 'show'

    #   puts "Enter ID"
    #   id = STDIN.gets.chomp 
    #   Contact.show(id)

    
    when 'quit'
      puts "----------The End-------------"
      break
  end

  end










