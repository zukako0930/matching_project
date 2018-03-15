class MeetRequest < ApplicationRecord
  belongs_to :meet_request_user, :class_name => User
  belongs_to :meet_target_user, :class_name => User
end
