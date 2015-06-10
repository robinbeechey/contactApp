

class Contact
 
  attr_accessor :name, :email, :id, :phone_numbers

    @@contact_list = []
    @@contacts = 1
 
  def initialize(name, email, phone_numbers=[])
    @name = name
    @email = email
    @phone_numbers = phone_numbers
    @id = @@contacts
    @@contacts += 1
  end

 
  def to_s
    "Id:".green + "#{id} -" + "Name:".green + "#{name}" + ", " +"e-mail:".green + "#{email}" + " Phone number(s):".green + "#{phone_numbers}"
  end


  def add_number(type, number)
    @phone_numbers.push("#{type}, #{number}")
  end

  def self.create(name, email, phone_number = [])
    @@contact_list << Contact.new(name, email, phone_number)
  end


  def self.find(term)
    @@contact_list.select do |contact|
      contact.name.downcase.include?(term) || contact.email.downcase.include?(term)
    end
  end


  def self.all
    @@contact_list
  end

  
  def self.show(id)
    @@contact_list.select do |contact|
        contact.id == id
    end
  end


  def self.duplicate(email)
    @@contact_list.detect do |contact|
      contact.email == email
    end
  end
    
 
 
end