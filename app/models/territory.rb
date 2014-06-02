class Territory < ActiveRecord::Base

  has_many :rooms, dependent: :restrict

end
