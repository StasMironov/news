class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def new
        @user = User.new
    end

    def create
    log_in @user
        @user = User.new(user_params)
        if @user.save
            flash[:succes] = "Wellcome to the Sample App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "Пользователь удалён"
        redirect_to users_url
    end

    def edit
    end

    def update
        if @user.update_attributes(user_params)
            flash[:succes] = "Профиль обновлён"
            redirect_to @user

        else
            render 'edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Предфильтры
    # Подтверждает вход пользователя

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Пожалуйста выполните вход в систему"
            redirect_to login_url
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
