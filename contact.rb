require 'csv'
require_relative 'contact_database'
require_relative 'contact_list'

class Contact 

  attr_accessor :name, :email, :phone_number
  attr_reader :id

  def initialize(name, email, phone_number)
      @name = name
      @email = email
      @phone_number = phone_number
      @id = id
  end

   
  def to_s
    # TODO: return string representation of Contact
    "#{@name}, #{@email}"
  end

  def save
  end

  def destroy
  end
 
  ## Class Methods
  class << self
    
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      @contact_arr << @name + @email
      @contact = Contact.new(name, email)

      CSV.open('contacts.csv', 'a') do |contacts|
        contacts << [@contact]
      end  

    end

 
    def find(index)
      # TODO: Will find and return contact by index
       CSV.foreach_with_index('contacts.csv', 'a') do |line, index| 
       end


    end

 
    def all
      # TODO: Return the list of contacts, as is
      Contact.new
      CSV.foreach('contact.csv', 'a') do |row|
        puts row
      end


    end

    
    def show(id)
      # TODO: Show a contact, based on ID
    end

    
  end


end




