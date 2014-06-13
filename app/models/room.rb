class Room < ActiveRecord::Base

  has_many :workplaces, dependent: :restrict_with_error
  belongs_to :territory

end
