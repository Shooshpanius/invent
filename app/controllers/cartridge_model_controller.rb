class CartridgeModelController < ApplicationController

  def index
    @form_data = {
        cartridge_models: CartridgeModel.all,
    }
  end

end
