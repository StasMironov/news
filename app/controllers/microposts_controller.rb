class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]

     def index
        @microposts = Micropost.paginate(page: params[:page], per_page: 5)
        @post = @microposts.where(status: true)
     end

    def new
        @microposts = Micropost.new
    end

    def create
        @microposts = current_user.microposts.build(micropost_params)

        if @microposts.save
            flash[:success] = "Объявление сохранено!"
            redirect_to root_url
        else
            redirect_to root_url
        end
    end

    def show
    end

    def destroy
     @micropost.destroy
     flash[:success] = "Объявление удалено!"
     redirect_to request.referrer || root_url
    end

    def edit
    end

    def update
        if @micropost.update_attributes(micropost_params)
            redirect_to @micropost
        else
            :edit
        end
    end

    private

    def set_post
        @micropost = Micropost.find(params[:id])
    end

    def micropost_params
        params.require(:micropost).permit(:content, :title, :status, :picture, :all_tags)
    end

    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end
