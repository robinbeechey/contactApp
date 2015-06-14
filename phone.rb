class Phone < ActiveRecord::Base
  belongs_to :contact
  validates :phone_number, presence: true

  def to_s
    "#{phone_number}"
  end

end 