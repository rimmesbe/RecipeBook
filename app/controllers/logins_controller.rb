class LoginsController < ApplicationController


  def show
    @login = User.new
  end

  def update
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      @login = User.new
      render 'show'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to users_path
  end

end
