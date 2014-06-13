class Territory < ActiveRecord::Base

  has_many :rooms, dependent: :restrict_with_error

end
