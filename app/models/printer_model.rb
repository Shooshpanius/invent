class PrinterModel < ActiveRecord::Base
  has_many :printers, dependent: :restrict_with_exception

end
