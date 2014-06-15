class CartridgeController < ApplicationController
  def index
    @form_data = {
        cartridges: Cartridge.all,
    }
  end


  def srv_cartridge_new_show
    @form_data = {
        rooms: Room.all.map { |room| [room.name, room.id] },
        printers: Printer.all.map { |printer| [printer.name, printer.id] },
        cartridge_models: CartridgeModel.all.map { |model| [model.model, model.id] }
    }
    render layout: false
  end


end
