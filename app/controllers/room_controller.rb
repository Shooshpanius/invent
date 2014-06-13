class RoomController < ApplicationController
  before_filter :is_login



  def index
    rooms = Room.all
    @form_data = {
        rooms: rooms
    }
  end



  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end
end
