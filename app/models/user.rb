class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :zipcode, :state, :city, :street_address, :first_name, :last_name, :charity_id, :category_id
  
  has_many :authentications
  has_many :carts

  def apply_omniauth(omniauth)
    self.email = omniauth['extra']['raw_info']['email'] if omniauth['provider'] == 'facebook'
    secret = omniauth['credentials'].try(:[],'secret')
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token=> omniauth['credentials']['token'], :secret => secret)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def build_stripe_params(user_url)
    { 'stripe_user[email]' => email, 
    'stripe_user[business_type]' => 'sole_prop', 
    'stripe_user[url]' => user_url, 
    'stripe_user[first_name]' => first_name,
    'stripe_user[last_name]' => last_name, 
    'stripe_user[street_address]' => street_address, 
    'stripe_user[zip]' => zipcode, 
    'stripe_user[state]' => state, 
    'stripe_user[city]' => city, 
    'stripe_user[currency]' => 'usd' }.reject {|k,v| v.nil?}
  end
end
