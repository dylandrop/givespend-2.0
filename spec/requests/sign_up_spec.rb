require 'spec_helper'
require 'webmock/rspec'
describe 'signing up' do
  def visit_sign_up
    visit '/'
    click_on "SIGN IN"
    click_link "Sign up"
  end

  def set_omniauth_for provider
    credentials = {:provider => provider,
                   :uuid   => "1234"}
   
    OmniAuth.config.mock_auth[provider] = {
      'uid' => credentials[:uuid]
    }
  end

  specify 'via email' do
    visit_sign_up
    fill_in "Email", with: "klaus@octavius.com"
    fill_in "Password", with: "artisblood"
    fill_in "Password confirmation", with: "artisblood"
    click_button "Sign up"
    page.find(".notice").text.should == "Welcome! You have signed up successfully."
    my_account = User.last
    my_account.email.should == "klaus@octavius.com"
  end

  specify 'via Facebook' do
    visit_sign_up
    set_omniauth_for :facebook
    click_link "Sign in with Facebook"
  end
end