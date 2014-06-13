# encoding: utf-8
class TerritoryController < ApplicationController

  before_filter :is_login

  def index
    territories = Territory.all
    @form_data = {
        territories: territories
    }
  end

  def srv_territory_new_show
      render layout: false
  end

  def srv_territory_new_save
    Territory.create(
        name: 	params[:territory_name],
        address: 	params[:territory_address]
    )
    render nothing: true
  end

  def srv_territory_delete
    begin
      Territory.destroy(Territory.find(params[:territory_id]))
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
