class TerritoryController < ApplicationController

  before_filter :is_login

  def index
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



  private
  def is_login
    if !session[:is_login]
      redirect_to "/login"
    end
  end


end
