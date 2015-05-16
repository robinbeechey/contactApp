class Contact < ActiveRecord::Base

   has_many :phones
   validates_format_of :email, :with => /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
   

   def to_s

    "#{first_name}, #{last_name}, #{email}"

   end
  
end