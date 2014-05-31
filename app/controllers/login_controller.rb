class LoginController < ApplicationController

  def index
    if session[:is_login]
      redirect_to '/'
    end
  end

  def srv_check_login
    user = User.find_by_login(params[:login])
    if user.nil? or user.pwd != params[:password]
    else
      session[:is_login] = true
      session[:user_id] = user.id
      session[:user_login] = user.login
      if user.adm
        session[:is_admin] = true
      end
    end
    render :nothing => true
  end

  def srv_logout
    reset_session
    render :nothing => true
  end

end
