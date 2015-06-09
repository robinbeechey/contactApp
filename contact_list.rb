require_relative 'contact_database'
require_relative 'contact'



def starter

  puts "----------Contact List----------"

  loop do

  print %q(
Menu

New - create a new contact
Update - update contact
Delete - delete contact
List - show all contacts
Find - find category
Quit - quit program
  > ) 
  command = gets.chomp.downcase
    case command
      when 'new'
        new_contact
      when 'update'
        updater
      when 'delete'
        delete_contact
      when 'list'
        list 
      when 'find'
        find_case
      when 'quit'
        puts "----------The End-------------"
        break
    end

  end

end

  def updater
    print "Enter ID: "
    @id = gets.chomp.to_i
    if check_id?
    # binding.pry
      print "Enter first name: "
      first_name = gets.chomp
      print "Enter last name: "
      last_name = gets.chomp
      print "Enter email: "
      email = gets.chomp
      Contact.update_contact(first_name, last_name, email, @id)
    else
      puts "Contact not in database"
    end
  end

  def check_id?
    contact = Contact.find_by_id(@id)
  end


  def new_contact
    print "Enter first name: "
    first_name = gets.chomp
    print "Enter last name: "
    last_name = gets.chomp
    print "Enter email: "
    email = gets.chomp
    # print "Enter phone number: "
    # phone_number = gets.chomp

    new_contact = Contact.create(first_name, last_name, email)
    puts new_contact
  end


  def list
    Contact.list_all.each do |contact|
      puts contact
    end
  end

  def delete_contact
    print "Enter ID: "
    input = gets.chomp.to_i
    Contact.delete(input)
  end

  def find_prompt
      print %q(
  First name
  Last name
  Email
  Phone
  ID - 
  > )
    print "Find by: "
    @category = gets.chomp.downcase
  end

  def find_case
    find_prompt
    case @category
     when 'first name'
      find_input
      contact = Contact.find_by_first_name(@input)
      puts contact
    when 'last name'
      find_input
      contact = Contact.find_by_last_name(@input)
      puts contact
    when 'email'
      find_input
      contact = Contact.find_by_email(@input)
      puts contact
    when 'number'
      find_input
      contact = Contact.find_by_number(@input)
      puts contact
    when 'id'
      find_input
      contact = Contact.find_by_id(@input.to_i)
      puts contact
    end
  end

  def find_input
    print "Enter query: "
    @input = gets.chomp
  end




starter










