class CartridgeController < ApplicationController
  before_filter :is_login

  def index
    @form_data = {
        cartridges: Cartridge.all,
    }
  end


  def srv_cartridge_new_show
    @form_data = {
        rooms: Room.all.map { |room| [room.name, room.id] },
        printers: Printer.all.map { |printer| [printer.inv_number + '(' + printer.printer_model.name + ')', printer.id] },
        cartridge_models: CartridgeModel.all.map { |model| [model.model, model.id] }
    }
    render layout: false
  end

  def srv_cartridge_new_save
    Cartridge.create(
        inv_number: 	params[:cartridge_inv_number],
        room_id: 	params[:cartridge_room],
        printer_id: 	params[:cartridge_printer],
        cartridge_model_id: 	params[:cartridge_models],
        comment: 	params[:cartridge_comment]
    )
    render nothing: true
  end


  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end

end
