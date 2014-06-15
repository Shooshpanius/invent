class CartridgeController < ApplicationController
  def index
    @form_data = {
        cartridges: Cartridge.all,
    }
  end
end
