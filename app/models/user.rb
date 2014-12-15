class User < ActiveRecord::Base


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.name       = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
      user.gender     = auth.info.gender
      user.birthday   = auth.info.birthday
      user.email      = auth.info.email
      user.save
    end
  end
end
