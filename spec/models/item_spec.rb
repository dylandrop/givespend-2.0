require 'spec_helper'
describe Item do
  describe 'price_to_cents' do
    it 'should convert my price when I give it a decimal value' do
      item = create(:item, price: 10.0)
      item.price.should == 1000
    end
    
    it 'should keep my price as an int when I give it an integer' do
      item = create(:item, price: 10)
      item.price.should == 1000
    end
  end
end