require 'csv'

class Contact 

  attr_accessor :name, :email

      @contact = 0
      @contact_arr = []


  def initialize(name, email)
    # TODO: assign local variables to instance variables
      @name = name
      @email = email

  end

   
  def to_s
    # TODO: return string representation of Contact
    "#{@name}, #{@email}"
  end
 
  ## Class Methods
  class << self
    
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts

      @contact = Contact.new(name, email)

      CSV.open("contacts.csv", "a") do |contacts|
        contacts << [@contact]
        @contact_arr << [@contact]
      end  

    end

 
    def find(index)
      # TODO: Will find and return contact by index
      CSV.readlines('contacts.csv', "a")
    end

 
    def all
      # TODO: Return the list of contacts, as is
      
    end

    
    def show(id)
      # TODO: Show a contact, based on ID
    end

    
  end


end




