## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

CSV_FILE = 'contacts.csv'

class ContactDatabase

  def self.load_all
    CSV.foreach(CSV_FILE) do |line|
      Contact.all << Contact.new(line[0],line[1],line[2])
    end
  end


  def self.write(name, email, phone_numbers)
    CSV.open(CSV_FILE, 'a') do |file|
      file << [name, email, phone_numbers]
    end
  end


  def self.save
    contacts = Contact.all

    CSV.open(CSV_FILE, 'w') do |file|
      contacts.each do |contact|
        binding.pry
        file << [contact.name, contact.email, contact.phone_numbers]
      end
    end
  end


end
