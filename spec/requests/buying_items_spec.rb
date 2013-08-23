require 'spec_helper'

describe 'buying items' do
  let(:me) { create(:user)}
  before do
    create(:item)
    login me
    visit items_path
  end

  specify 'i need to have a full shipping address' do
    me.update_attribute(:city, nil)
    visit carts_path
    page.find(".alert").should have_content("Complete your shipping info to purchase an item.")
    current_path.should == edit_user_registration_path
  end

  specify 'i should be able to add an item and checkout', js: true do
    double_click ".item-card"
    click_link "ADD TO CART"
  end
end