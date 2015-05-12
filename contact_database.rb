## TODO: Implement CSV reading/writing
require_relative 'contact_list'
require_relative 'contact'
require 'csv'

class ContactDatabase

  attr_accessor :file

  def initialize(file)
    @file = file
  end  


  def read 
    
    CSV.read('contacts.csv')

  end


  def write

    CSV.open('contacts.csv','a') do |contact|
      

  end



end