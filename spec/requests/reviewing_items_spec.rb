require 'spec_helper'
describe 'reviews for an item' do
  let!(:seller) { create(:user, first_name: "Monsieur") }
  let!(:buyer) { create(:user, first_name: "Bubba") }
  let!(:item) { create(:item, seller: seller, buyer: buyer) }

  describe 'i can make reviews' do
    specify 'from my profile page' do
      login buyer
      visit my_profile_path
      within "#new_review" do
        choose "review_rating_5"
        fill_in "review[description]", with: "A great item"
        click_button "Create Review"
      end
      within ".item-review" do
        page.should have_content "5"
        page.should have_content "A great item"
      end
    end

  end

  describe 'i should see reviews' do

    specify 'on the profile page' do
      create(:review, item: item, user_who_gave_review: buyer, user_who_received_review: seller, rating: 4, description: "All was good")
      visit user_path(seller)
      within '.reviews' do
        page.should have_content("All was good")
        page.should have_content("Rating: 4")
      end
    end
  end
end