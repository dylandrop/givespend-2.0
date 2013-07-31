require 'spec_helper'

describe 'buying items' do
  let(:me) { create(:user)}
  before do
    create(:item)
    login me
    visit items_path
  end

  specify 'i should be able to add an item and checkout', js: true do
    double_click ".item-card"
    click_link "ADD TO CART"
  end
end