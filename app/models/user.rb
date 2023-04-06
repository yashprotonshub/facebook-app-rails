class User < ApplicationRecord
    has_many :sent_friend_requests, class_name: "Friendrequest", foreign_key: 'sender_id'
    has_many :friend_request_receivers, through: :sent_friend_requests, source: :receiver

    has_many :received_friend_requests, class_name: "Friendrequest", foreign_key: 'receiver_id'
    has_many :friend_request_senders, through: :received_friend_requests, source: :sender

    #has_many :senders, through: :friendrequests
end

