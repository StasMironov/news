class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        # Осуществить вход пользователя
        log_in user
        redirect_back_or user
    else
        # Выдать сообщение об ошибке
        flash.now[:danger] = 'Неверный email и(или) пароль!'
        render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
