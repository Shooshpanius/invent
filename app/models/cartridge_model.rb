class CartridgeModel < ActiveRecord::Base
  has_many :cartridges, dependent: :restrict_with_exception

end
