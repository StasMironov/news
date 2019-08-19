class ResultsController < ApplicationController
    def index
       if params[:content]
         @results = Micropost.where('content LIKE ?', "%#{params[:content]}%")
       else
         @results = Micropost.all
       end

      if params[:author]
        @user_id = User.where(name: params[:author])
        @results = Micropost.where(user_id: @user_id)
      end
    end
end