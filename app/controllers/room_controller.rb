class RoomController < ApplicationController
  before_filter :is_login



  def index
    @form_data = {
        rooms: Room.all,
    }
  end

  def srv_room_new_show
    @form_data = {
        territories: Territory.all.map { |territory| [territory.name, territory.id] }
    }
    render layout: false
  end

  def srv_room_new_save
    Room.create(
        name: 	params[:room_name],
        territory_id: 	params[:territories]
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
