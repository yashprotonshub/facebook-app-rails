class CommentsController < ApplicationController
    def new
        @pid=current_user.posts.find(params[:post_id]).id
        @post=current_user.posts.find(params[:post_id])
        @comment=current_user.posts.find(@pid).comments.build
    end

    def create
        @comment=Post.find(params[:post_id]).comments.create(comment_params.merge(user_id: current_user.id))
        redirect_to user_post_path(current_user, params[:post_id])
    end

    def destroy
        @comment=User.find(params[:user_id]).comments.find(params[:id].to_i)
        @comment.destroy
        redirect_to user_post_path(current_user, params[:post_id])    
    end

    def edit
        @comment=User.find(params[:user_id]).comments.find(params[:id].to_i)
        @post=Post.find(@comment.post_id)
    end

    def update
        @comment=User.find(params[:user_id]).comments.find(params[:id].to_i)
        @post=@comment.post_id
        if @comment.update(comment_params)
            redirect_to user_post_path(current_user, @post)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end

end
