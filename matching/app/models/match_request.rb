class MatchRequest < ApplicationRecord
belongs_to :request_user, :class_name => User
belongs_to :target_user, :class_name => User
end
