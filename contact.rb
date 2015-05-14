
require 'pg'

require_relative 'contact_database'
# require_relative 'contacts_table'

class Contact 

  attr_accessor :first_name, :last_name, :email, :phone_number
  attr_reader :id


  def initialize(first_name, last_name, email, phone_number, id=nil)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @phone_number = phone_number
      @id = id
  end

   
  def to_s
    # TODO: return string representation of Contact
    "#{@first_name} #{@last_name} #{@email} #{@phone_number}"

  end

  def is_new?
    @id.nil?
  end

  def save

    if is_new?
    result = @@con.exec_params('INSERT INTO contacts_table (first_name, last_name, email, phone_number) VALUES ($1, $2, $3, $4) returning id', [@first_name, @last_name, @email, @phone_number])
      @id = result[0]['id']
    else
       @@con.exec_params('UPDATE contacts_table SET first_name = $1, last_name = $2, email = $3, phone_number = $4 WHERE id = $5', [@first_name, @last_name, @email, @phone_number, @id])
    end

  end

  def destroy
    @@con.exec_params('DELETE FROM contacts_table WHERE id = $1', [@id])
  end

 

  class << self

    def connection
      @@con ||= PG::Connection.new({
      dbname: 'dbl01dhuenecbc',
      port: 5432,
      user: 'bqjsghfauqlbkv',
      host: 'ec2-50-19-233-111.compute-1.amazonaws.com',
      password: 'twZcyMXLTpFC_zj40JuShLOWTE'
    })

    end
    
    def create(first_name, last_name, email, phone_number)

        Contact.connection

        new_contact = Contact.new(first_name, last_name, email, phone_number) 
        new_contact.save

    end


    def find_all_by_number(phone_number)

      Contact.connection
      result = nil
        @@con.exec_params('SELECT * FROM contacts_table WHERE phone_number = $1', [phone_number]) do |rows|
            rows.each do |row|
              result = Contact.new(
                  row['first_name'],
                  row['last_name'],
                  row['email'],
                  row['phone_number'],
                  row['id']
              )
            end
          end
      puts result

    end
      
    def find_all_by_firstname(first_name)

      Contact.connection
      result = nil
        @@con.exec_params('SELECT * FROM contacts_table WHERE first_name = $1', [first_name]) do |rows|
            rows.each do |row|
              result = Contact.new(
                  row['first_name'],
                  row['last_name'],
                  row['email'],
                  row['phone_number'],
                  row['id']
              )
            end
          end
      puts result

    end


    def find_all_by_lastname(last_name)

      Contact.connection
      result = nil
        @@con.exec_params('SELECT * FROM contacts_table WHERE last_name = $1', [last_name]) do |rows|
            rows.each do |row|
              result = Contact.new(
                  row['first_name'],
                  row['last_name'],
                  row['email'],
                  row['phone_number'],
                  row['id']
              )
            end
          end
      puts result

    end


    def find_by_email(email)

      Contact.connection
      result = nil
        @@con.exec_params('SELECT * FROM contacts_table WHERE email = $1', [email]) do |rows|
            rows.each do |row|
              result = Contact.new(
                  row['first_name'],
                  row['last_name'],
                  row['email'],
                  row['phone_number'],
                  row['id']
              )
            end
          end
      puts result

    end



 
    def list 

      Contact.connection
      result = []
      @@con.exec_params('SELECT * FROM contacts_table;') do |rows|
        rows.each do |row|
          result << Contact.new(row['first_name'],row['last_name'],row['email'],row['phone_number'],row['id'])
        end
      end
      puts result
        
    end
    

    
    def show(id)     

      Contact.connection
      result = nil
        @@con.exec_params('SELECT * FROM contacts_table WHERE id = $1 LIMIT 1', [id]) do |rows|
            rows.each do |row|
              result = Contact.new(
                  row['first_name'],
                  row['last_name'],
                  row['email'],
                  row['phone_number'],
                  row['id']
              )
            end
          end
          puts result

    end
    
  end
end




