module IntegrationSpecHelper
  def login user
    post new_user_session_path, :user => {:email => user.email, :password => 'password'} # default password
  end
end

RSpec.configure do |c|
  c.include IntegrationSpecHelper
end 