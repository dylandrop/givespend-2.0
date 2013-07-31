require 'spec_helper'

describe 'signing up' do
  def visit_sign_up
    visit '/'
    click_on "SIGN IN"
    click_link "Sign up"
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

  specify 'via Facebook with email' do
    visit_sign_up
    set_omniauth_for :facebook
    click_link "Sign in with Facebook"
    page.find(".notice").text.should == "Welcome! You have signed up successfully."
  end

  specify 'via Twitter' do
    visit_sign_up
    set_omniauth_for :twitter
    click_link "Sign in with Twitter"
    fill_in "Email", with: "sample@test.com"
    click_button "Sign up"
    page.find(".notice").text.should == "Welcome! You have signed up successfully."
  end
end