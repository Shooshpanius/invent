class TerritoryController < ApplicationController
  def index
  end



  def srv_territory_new_show
      render layout: false
  end

  def srv_territory_new_save
    render text: '222'
    # render nothing: true
  end


end
