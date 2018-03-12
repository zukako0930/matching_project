class User < ApplicationRecord
# Login機能のため
has_secure_password
# MatchRequestを介してuser-userがn対nの関係
has_many :sent_match_requests, :class_name => MatchRequest, :foreign_key => :request_user_id
has_many :targeted_match_requests, :class_name => MatchRequest, :foreign_key => :target_user_id
# MeetRequestを介してuser-userがn対nの関係
has_many :sent_meet_requests, :class_name => MeetRequest, :foreign_key => :meet_request_user_id
has_many :targeted_meet_requests, :class_name => MeetRequest, :foreign_key => :meet_target_user_id
# Messageを介してuser-userがn対nの関係
has_many :send_message, :class_name => Message, :foreign_key => :send_user_id
has_many :receive_message, :class_name => Message, :foreign_key => :receive_user_id
# emailをdownscaleすることで確実に一致させる
before_save { self.email = email.downcase }
# バリデーション
validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
# 画像アップロード用
mount_uploader :image, ImageUploader

  def matchers
      requester_ids = targeted_match_requests.pluck(:request_user_id)
          sent_match_requests
                .eager_load(:target_user)
                      .select { |r| requester_ids.include? r.target_user_id }
                            .map { |r| r.target_user }
  end

  def meet_matchers
      requester_ids = targeted_meet_requests.pluck(:meet_request_user_id)
          sent_meet_requests
                .eager_load(:meet_target_user)
                      .select { |r| requester_ids.include? r.meet_target_user_id }
                            .map { |r| r.meet_target_user }
  end
end
