require 'spec_helper'

describe User do
  describe "#shipping_info" do
    let(:user) { create(:user, first_name: "Dylan", last_name: "Drop", street_address: "2920 Broadway", city: "New York", state: "NY", zipcode: 10027) }
    
    it 'formats with text' do
      user.shipping_info.should == "Dylan Drop\n2920 Broadway\nNew York, NY 10027"
    end

    it 'formats with html' do
      user.shipping_info(:html).should == "Dylan Drop<br>2920 Broadway<br>New York, NY 10027"
    end
  end
end
