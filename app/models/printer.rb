class Printer < ActiveRecord::Base
  has_many :cartridges, dependent: :restrict_with_exception
  belongs_to :printer_model
end
