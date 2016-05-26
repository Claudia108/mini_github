class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.username           = auth_info.info.nickname
      new_user.profile_pic        = auth_info.info.image
      new_user.following          = auth_info.extra.raw_info.following
      new_user.followers          = auth_info.extra.raw_info.followers
      new_user.email              = auth_info.info.email
      new_user.oauth_token        = auth_info.credentials.token
    end
  end
end
