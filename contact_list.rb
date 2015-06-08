require_relative 'contact'
require_relative 'contact_database'
require 'colorize'

class DuplicateEmail < Exception
end
class ContactNotFound < Exception
end
class NoDataFound < Exception
end

class Run

  def initialize
    ContactDatabase.load_all
  end


  def prompt    
    case ARGV[0]
    when "new" then new_contact
    when "list" then list_all
    when "show" then show_by_id
    when "find" then find_by_term
    when "add" then add_new_number
    when "help"
      puts "Here are your choices\nNew - Add contact\nList - Display all\nShow - Show contact by ID\nFind - Find by term\nAdd - Add new number"
    end
  end


  def new_contact 
    begin 
    puts "Enter email"
    email = STDIN.gets.chomp
    raise DuplicateEmail, "Contact allready in database" if Contact.duplicate(email)
    puts "Enter name" 
    name = STDIN.gets.chomp
    number = new_numbers
    Contact.create(name, email, number[0] => number[1])
    ContactDatabase.write(name, email, number[0] => number[1])  
    rescue DuplicateEmail => e
      puts e.message
    end
  end

  #also not sure why not f***cking working
  def add_new_number
    contact = Contact.show(ARGV[1].to_i)
    puts contact
    number = new_numbers
    contact[0].add_number(number[0], number[1])
  end


  def new_numbers
    puts "Enter type of phone number"
    type = STDIN.gets.chomp
    puts "Enter phone number"
    number = STDIN.gets.chomp
    [type, number]
  end


  def list_all
    puts Contact.all  
  end


  def show_by_id
    begin
    contact = Contact.show(ARGV[1].to_i)
    raise ContactNotFound, "Contact not found" if contact.nil? || contact.empty?
    puts contact
    rescue ContactNotFound => e
      puts e.message
    end
  end


  def find_by_term
    begin
    contact = Contact.find(ARGV[1])
    raise NoDataFound, "Contacts with the that Data do not exist" if contact.nil? || contact.empty?
    puts contact
    rescue NoDataFound => e
      puts e.message
    end
  end


end

contact_list = Run.new
contact_list.prompt





