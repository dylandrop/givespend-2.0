require 'spec_helper'
describe 'reviews for an item' do
  describe 'i should see reviews' do
    let!(:seller) { create(:user, first_name: "Monsieur") }
    let!(:buyer) { create(:user, first_name: "Bubba") }
    let!(:item) { create(:item, seller: seller) }

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