class Phone < ActiveRecord::Base

  belongs_to :contact

  def to_s
    "#{phone_number}"
  end

end 