class DetailsController < ApplicationController
  def index
    @allusers=User.all
    @allrequests= User.find(current_user.id).friend_requests_received.where(status:"pending")
    @allfriends= User.find(current_user.id).friend_requests_received.where(status:"approved").pluck(:sender_id)+User.find(current_user.id).friend_requests_sent.where(status:"approved").pluck(:receiver_id)

  end
end




