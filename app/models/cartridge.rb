class Cartridge < ActiveRecord::Base
  belongs_to :room
  belongs_to :cartridge_model
  belongs_to :printer
end
