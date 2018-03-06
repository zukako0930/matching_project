class User < ApplicationRecord
has_secure_password
has_many :sent_match_requests, :class_name => MatchRequest, :foreign_key => :request_user_id
has_many :targeted_match_requests, :class_name => MatchRequest, :foreign_key => :target_user_id

has_many :send_message, :class_name => Message, :foreign_key => :send_user_id
has_many :receive_message, :class_name => Message, :foreign_key => :receive_user_id

before_save { self.email = email.downcase }
validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
mount_uploader :image, ImageUploader

  def matchers
      requester_ids = targeted_match_requests.pluck(:request_user_id)
          sent_match_requests
                .eager_load(:target_user)
                      .select { |r| requester_ids.include? r.target_user_id }
                            .map { |r| r.target_user }
  end
end
