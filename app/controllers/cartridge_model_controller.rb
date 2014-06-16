class CartridgeModelController < ApplicationController

  def index
    @form_data = {
        cartridge_models: CartridgeModel.all,
    }
  end

  def srv_cartridge_model_new_show

    render layout: false
  end

end
