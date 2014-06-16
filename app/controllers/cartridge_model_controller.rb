class CartridgeModelController < ApplicationController

  def index
    @form_data = {
        cartridge_models: CartridgeModel.all,
    }
  end

  def srv_cartridge_model_new_show
    render layout: false
  end

  def srv_cartridge_model_edit_show
    @form_data = {
        cartridge_model: CartridgeModel.find(params[:cartridge_model_id])
    }
    render layout: false
  end

  def srv_cartridge_model_new_save
    CartridgeModel.create(
        model: 	params[:cartridge_model_model],
        model_code: 	params[:cartridge_model_model_code],
        resource: 	params[:cartridge_model_resource],
        comment: 	params[:cartridge_model_comment]
    )
    render nothing: true
  end

  def srv_cartridge_model_edit_save
    CartridgeModel.update(
        params[:cartridge_model_id],
        model: 	params[:cartridge_model_model],
        model_code: 	params[:cartridge_model_model_code],
        resource: 	params[:cartridge_model_resource],
        comment: 	params[:cartridge_model_comment]
    )
    render nothing: true
  end

end
