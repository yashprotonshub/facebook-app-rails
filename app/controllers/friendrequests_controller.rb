class FriendrequestsController < ApplicationController
    def create
        @friend=Friendrequest.create(status:"pending", sender_id:current_user.id, receiver_id: params[:receiver])      
    end
    def update
        @friend=Friendrequest.find(params[:friendrequest_id])
        @friend.update(status:"approved")
    end
    def destroy
        @friend=Friendrequest.find(params[:friendrequest_id])
        @friend.destroy
    end

    def removefriend
        @remove_friend= (Friendrequest.find_by(sender_id: current_user.id, receiver_id:params[:friendrequest_id], status:"approved") ) || (Friendrequest.find_by(sender_id: params[:friendrequest_id] , receiver_id: current_user.id , status:"approved"))
        @remove_friend.destroy
    end
end



