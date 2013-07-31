require 'spec_helper'
describe 'creating a new item' do

  def go_to_new_items_for user
    login user
    visit '/items/new'
  end

  before do
    create(:nonprofit, name: 'WWF')
    create(:category, name: 'Books')
  end

  context 'i am not authorized' do
    let(:me) { create(:user) }

    specify 'i am not signed in' do
      visit '/items/new'
      current_path.should == new_user_session_path
    end

    specify 'i should be redirected and i should authorize' do
      go_to_new_items_for me
      current_path.should == verify_seller_user_path(me.id)
      click_link 'Sign in with Stripe'
      me.authorizations.last.provider.should == 'stripe_connect'
      current_path.should == new_item_path
    end
  end

  context 'i am authorized and want to list' do
    let(:me) { create(:user, authentications: [create(:authentication, provider: 'stripe_connect')]) }

    specify 'i fully fill out a valid form' do
      go_to_new_items_for me
      fill_in 'Price', with: '5.00'
      fill_in 'item_name', with: 'The Stranger -- Camus'
      select 'Books', from: 'Category'
      fill_in 'Description', with: 'The best book I\'ve ever read'
      select '10', from: 'Percentage'
      select 'WWF', from: 'Choose your nonprofit'
      page.attach_file('item[image_attributes][content]', 'spec/assets/images/rails.png')
      click_button 'List'
      page.find(".notice").text.should == "Item listed."
    end
  end

end