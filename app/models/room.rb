class Room < ActiveRecord::Base

  has_many :workplaces, dependent: :restrict
  belongs_to :territory

end
