
require 'colorize'

class Contact < ActiveRecord::Base
  has_many :phones
  validates :first_name, :last_name, :email, presence: true

   
  def to_s
    "ID:".green+"#{id}"+" Full Name:".green+" #{first_name} #{last_name},"+" E-mail:".green+" #{email},"+" Phone#".green+" #{phones.join(', ')} "
  end

end




