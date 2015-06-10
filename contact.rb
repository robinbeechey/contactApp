
require 'pg'
require 'colorize'

class Contact 

  attr_accessor :first_name, :last_name, :email, :phone_number
  attr_reader :id

  def initialize(first_name, last_name, email, id=nil)
      @first_name = first_name
      @last_name = last_name
      @email = email
      # @phone_number = phone_number
      @id = id
  end

   
  def to_s
    "ID:#{id} Full Name: #{@first_name} #{@last_name}, E-mail: #{@email}, Phone# #{@phone_number}".green
  end


  def is_new?
    @id.nil?
  end


  def save
    if is_new?
      result = $conn.exec_params('INSERT INTO contacts (first_name, last_name, email) VALUES ($1, $2, $3)', [first_name, last_name, email])
    else
      result = $conn.exec_params("UPDATE contacts SET first_name = $1, last_name = $2, email = $3 WHERE id = $4;", [first_name, last_name, email, id])
    end
  end


  class << self

    def create(first_name, last_name, email)
      new_contact = Contact.new(first_name, last_name, email)
      new_contact.save
      new_contact
    end

    def delete(id)
      $conn.exec_params('DELETE FROM contacts WHERE id = $1', [id])
    end

    def update_contact(first_name, last_name, email, id)
      new_contact = Contact.new(first_name, last_name, email, id)
      new_contact.save
      new_contact
    end


    def find_by_number(phone_number)
      result = $conn.exec_params('SELECT * FROM contacts WHERE phone_number = $1',[phone_number])
      create_array(result)
    end


    def find_by_last_name(last_name)
      result = $conn.exec_params('SELECT * FROM contacts WHERE last_name = $1',[last_name] )
      create_array(result)
    end


    def find_by_email(email)
      result = $conn.exec_params('SELECT * FROM contacts WHERE email = $1',[email] )
      create_array(result)
    end


    def find_by_first_name(name)
      result = $conn.exec_params('SELECT * FROM contacts WHERE first_name = $1',[name] )
      create_array(result)
    end


    def find_by_id(id)
      result = $conn.exec_params('SELECT * FROM contacts WHERE id = $1',[id] )
      create_array(result)
    end

 
    def list_all 
      result = $conn.exec_params('SELECT * FROM contacts')
      create_array(result)
    end

    private

    def create_array(contacts)
      result = []
      contacts.each do |row|
        result << Contact.new(row['first_name'],row['last_name'],row['email'],row['id'])
      end
      result
    end
    
  end
end




