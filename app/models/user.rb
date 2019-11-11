class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         
  def self.find_for_oauth(auth, current_user)
    
    # 가입이 있다면 user 변수에는 User에 대한 정보가 있을테고, 없으면 nil값
    user = current_user
    
    # 이미 있는 계정인지 확인한다.
    email = auth.info.email
      user = User.where(:email => email).first  
      unless self.where(email: auth.info.email).exists?
        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          user = User.new(
            email: email ? auth.info.email : "#{auth.uid}@#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
          )            
          user.save!
        end
      end
    user
    
  end
  
  def email_required?
    false
  end
 
  def email_changed?
    false
  end
end
