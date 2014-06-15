class Room < ActiveRecord::Base

  has_many :workplaces, dependent: :restrict_with_exception
  has_many :cartridges, dependent: :restrict_with_exception
  belongs_to :territory

end
