module IntegrationSpecHelper
  def login user
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: 'password' #default password
    click_button "Sign in"
  end

  def set_omniauth_for provider
    OmniAuth.config.mock_auth[provider] = {
      'provider' => provider.to_s,
      'uid' => '1234',
      'credentials' => {
        'token' => 'my_token',
        'secret' => 'my_secret'
      },
      'extra' => {
        'raw_info' => {
          'email' => 'somethingsomething@test.com'
        }
      }
    }
  end

  def double_click selector
    page.should have_css selector
    page.execute_script(%Q{ $('#{selector}').dblclick(); })
  end
end

RSpec.configure do |c|
  c.include IntegrationSpecHelper
end 