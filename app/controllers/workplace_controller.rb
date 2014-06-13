class WorkplaceController < ApplicationController
  before_filter :is_login



  def index
    @form_data = {
        workplaces: Workplace.all,
    }
  end

  def srv_workplace_new_show
    @form_data = {
        rooms: Room.all.map { |room| [room.name, room.id] }
    }
    render layout: false
  end


  def srv_workplace_new_save
    Workplace.create(
        name: 	params[:workplace_name],
        room_id: 	params[:rooms]
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
