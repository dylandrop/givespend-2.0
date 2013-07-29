require 'spec_helper'

describe 'signing up' do
  specify 'via email' do
    visit '/'
    click_on "SIGN IN"
    click_link "Sign up"
    fill_in "Email", with: "klaus@octavius.com"
    fill_in "Password", with: "artisblood"
    fill_in "Password confirmation", with: "artisblood"
    click_button "Sign up"
    page.find(".notice").text.should == "Welcome! You have signed up successfully."
    my_account = User.last
    my_account.email.should == "klaus@octavius.com"
  end
end