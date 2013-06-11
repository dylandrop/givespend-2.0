require 'spec_helper'
describe Item do
  it { should validate_presence_of :name }
  it { should validate_presence_of :nonprofit }
  it { should validate_presence_of :seller }
  it { should validate_presence_of :category }
  it { should validate_presence_of :price }
  it { should validate_presence_of :percentage }
  
  it { should ensure_inclusion_of(:percentage).in_array(Item::PERCENTAGES) }
  it { should_not allow_value(1234).for(:percentage) }

  it { should_not allow_value(0).for(:price) }
  it { should allow_value(123).for(:price) }

  describe '#price_to_cents' do
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