## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  def read
    CSV.foreach('contacts.csv') do |row|
      puts row.inspect
    end
  end


  def write
    CSV.open('contacts.csv', 'w') do |row|
      row << @@contacts  
    end
  end

end
