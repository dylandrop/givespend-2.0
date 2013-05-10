class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :zipcode, :state, :city, :street_address, :first_name, :last_name
  
  has_many :authentications

  def apply_omniauth(omniauth)
    self.email = omniauth['extra']['raw_info']['email'] if omniauth['provider'] == 'facebook'
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token=> omniauth['credentials']['token'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
