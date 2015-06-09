## TODO: Implement CSV reading/writing
require 'pg'
require 'pry'

class ContactDatabase

  def initialize
    puts "Connecting"
    begin
      $conn = PG::connect(
      dbname: 'dbl01dhuenecbc',
      port: 5432,
      user: 'bqjsghfauqlbkv',
      host: 'ec2-50-19-233-111.compute-1.amazonaws.com',
      password: 'twZcyMXLTpFC_zj40JuShLOWTE'
    )
    rescue PG::ConnectionBad
      puts "Did no connect"
    end
    puts "Connected"
  end

end

ContactDatabase.new



