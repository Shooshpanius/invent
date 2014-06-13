# encoding: utf-8
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

  def srv_workplace_edit_show
    @form_data = {
        workplace_edit: Workplace.find(params[:workplace_id]),
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

  def srv_workplace_delete
    begin
      Workplace.destroy(Workplace.find(params[:workplace_id]))
      render text: 'Запись удалена'
    rescue ActiveRecord::DeleteRestrictionError => e
      render text: 'Удаление невозможно, есть связанные объекты'
    end
  end


  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end
end
