class CommentsController < ApplicationController

    def new
       @micropost = Micropost.find(params[:micropost_id])
       @comment = current_user.comments.build
    end


    def create
     @micropost = Micropost.find(params[:micropost_id])
     @comment = current_user.comments.build(comment_params)
     @comment.micropost_id = @micropost.id


     if @comment.save
        flash[:success] = "Комментарий создан!"
        redirect_to @micropost
     else
        flash[:success] = "Ошибка"
     end
    end

    def show
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        if @comment.present?
          @comment.destroy
          flash[:success] = "Комментарий удалён!"
        end
        redirect_to request.referrer || root_url
    end



    private

    def comment_params
       params.require(:comment).permit(:comment_text)
    end
end
