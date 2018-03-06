class Message < ApplicationRecord
  belongs_to :send_user, :class_name => User
  belongs_to :receive_user, :class_name => User

  def self.talk(receive_id,send_id)
    if receive_id
      Message.where(send_user_id: send_id, receive_user_id: receive_id).or(Message.where(send_user_id: receive_id, receive_user_id: send_id))
    else
      Message.all
    end
  end

end
