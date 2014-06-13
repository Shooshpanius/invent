class RoomController < ApplicationController
  before_filter :is_login



  def index
    @form_data = {
        rooms: Room.all,
    }
  end

  def srv_room_new_show
    @form_data = {
        territories: Territory.all.map { |territoriy| [territoriy.name, territoriy.id] }
    }
    render layout: false
  end



  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end
end
