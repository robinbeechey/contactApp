require 'csv'
require 'pry'
require 'colorize'

CSV_FILE = 'contact_test.csv'

class DuplicateEmail < Exception
end
class ContactNotFound < Exception
end
class NoDataFound < Exception
end


class Contact
 
  attr_accessor :name, :email, :id, :phone_numbers

    @@contact_list = []
    @@contacts = 1
 
  def initialize(name, email, phone_numbers = {})
    @name = name
    @email = email
    @phone_numbers = phone_numbers    
    @id = @@contacts
    @@contacts += 1
  end
 
  def to_s
    "Id:".green + "#{id} -" + "Name:".green + "#{name}" + ", " +"e-mail:".green + "#{email}" + " Phone number(s):".green + "#{phone_numbers}"
  end
   

  def self.create(name, email, phone_numbers)
    @@contact_list << Contact.new(name, email, phone_numbers)
  end 

  def self.all
    @@contact_list
  end


  def self.duplicate(email)
    @@contact_list.detect do |contact|
      contact.email == email
    end
  end

 
end

class Run

  def initialize
    ContactDatabase.load_all
  end


  def prompt    
    case ARGV[0]
    when "new"
      new_contact
    when "list"
      list_all
    when "show"
      show_by_id
    when "find"
      find_by_term
    when "help"
      puts "Here are your choices\nNew - Add contact\nList - Display all\nShow - Show contact by ID\nFind - Find by term"
    end
  end


  def new_contact 
    begin 
    puts "Enter email"
    email = STDIN.gets.chomp
    raise DuplicateEmail, "Contact allready in database" if Contact.duplicate(email)
    puts "Enter name" 
    name = STDIN.gets.chomp
    numbers = new_numbers
    ContactDatabase.write(name, email, numbers[0] => numbers[1])    
    rescue DuplicateEmail => e
      puts e.message
    end
    # Contact.create(name,email)
  end


  def new_numbers
    puts "Enter type of phone number"
    type = STDIN.gets.chomp.to_sym
    puts "Enter phone number"
    number = STDIN.gets.chomp
    [type, number]
  end


  def list_all
    puts Contact.all  
  end

end


class ContactDatabase

  def self.load_all
    CSV.foreach(CSV_FILE) do |line|
      Contact.all << Contact.new(line[0],line[1],line[2])
    end
  end


  def self.write(name, email, phone_number)
    CSV.open(CSV_FILE, 'a') do |file|
      file << [name, email, phone_number]
    end
  end

end

contact_list = Run.new
contact_list.prompt

