# encoding: utf-8
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

  def srv_room_edit_show
    @form_data = {
        room_edit: Room.find(params[:room_id]),
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

  def srv_room_delete
    begin
      Room.destroy(Room.find(params[:room_id]))
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
