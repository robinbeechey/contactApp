require 'active_record'
require_relative 'contact'
require_relative 'phone'


class App 


  def initialize
    puts "Connecting"
    begin
      ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'dbl01dhuenecbc',
  username: 'bqjsghfauqlbkv',
  password: 'twZcyMXLTpFC_zj40JuShLOWTE',
  host: 'ec2-50-19-233-111.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
    rescue ActiveRecord::Base.Connected?
      puts "Did no connect"
    end
    puts "Connected"
  end


  def launch

    puts "----------Contact List----------"

    loop do

  print %q(
Menu

New - create a new contact
Add - add number
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
        when 'add'
          add_number
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
      print "Enter first name: "
      first_name = gets.chomp
      print "Enter last name: "
      last_name = gets.chomp
      print "Enter email: "
      email = gets.chomp
      print "Enter phone: "
      number = gets.chomp
      contact = Contact.find(@id)
      contact.update(first_name: first_name, last_name: last_name, email: email)
    else
      puts "Contact not in database"
    end
  end

  def check_id?
    Contact.find(@id)
  end

  def add_number
    print "Enter ID: "
    @id = gets.chomp.to_i
    if check_id?
      print "Enter phone: "
      number = gets.chomp
      contact = Contact.find(@id)
      contact.phones.create(phone_number: number)
      puts contact
    else
      puts "Contact not in database"
    end
  end

  def new_contact
    print "Enter first name: "
    first_name = gets.chomp
    print "Enter last name: "
    last_name = gets.chomp
    print "Enter email: "
    email = gets.chomp
    print "Enter phone number: "
    number = gets.chomp

    new_contact = Contact.create(first_name: first_name, last_name: last_name, email: email)
    new_contact.phones.create(phone_number: number)
    puts new_contact
  end


  def list
    Contact.all.each do |contact|
      puts contact
    end
  end

  def delete_contact
    print "Enter ID: "
    input = gets.chomp.to_i
    Contact.destroy(input)
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
      contact = Contact.where(first_name: @input)
      puts contact
    when 'last name'
      find_input
      contact = Contact.where(last_name: @input)
      puts contact
    when 'email'
      find_input
      contact = Contact.where(email: @input)
      puts contact
    when 'phone'
      #not working, must ask
      find_input
      contact = Contact.phones
      contact.where(phone_number: @input)
      puts contact
    when 'id'
      find_input
      contact = Contact.find(@input.to_i)
      puts contact
    end
  end

  def find_input
    print "Enter query: "
    @input = gets.chomp
  end

end




open_contact = App.new

open_contact.launch










