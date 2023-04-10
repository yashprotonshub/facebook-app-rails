class PostsController < ApplicationController
    def index
        @posts=Post.all
        @allusers=User.all
        @allrequests= User.find(current_user.id).friend_requests_received.where(status:"pending")
        @allfriends= User.find(current_user.id).friend_requests_received.where(status:"approved").pluck(:sender_id)+User.find(current_user.id).friend_requests_sent.where(status:"approved").pluck(:receiver_id)
    end

    def new
        @post=current_user.posts.build
    end

    def create
        @post=current_user.posts.create(post_params)
        if @post.save
            redirect_to user_posts_path(current_user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post=Post.find(params[:id])
    end

    def update
        @post=Post.find(params[:id])
        if @post.update(post_params)
            redirect_to user_post_path(current_user, @post)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def show
        @post=Post.find(params[:id])
        @pid=@post.id
        @allcomments=Post.find(@pid).comments
        @newcomment=Post.find(@pid).comments.build
    end
    
    def destroy
        @post=Post.find(params[:id])
        @post.destroy
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

end
