class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

    def index
        @users = User.paginate(page: params[:page], per_page: 5).distinct
    end

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def new
        @post = Micropost.new
        @user = User.new
    end

    def create
    @user = User.new(user_params)
    log_in @user
        if @user.save
            flash[:succes] = "Wellcome to the Sample App!"
            redirect_to root_path
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

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end


end
