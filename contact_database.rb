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


  def self.write(name, email, phone_number)
    CSV.open(CSV_FILE, 'a') do |file|
      file << [name, email, phone_number]
    end
  end

end
