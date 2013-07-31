def paperclip_fixture(model, attachment, extension)
  Image.any_instance.stub(:save_attached_files).and_return(true)
  base_path = File.join(File.dirname(__FILE__), "..", "assets", "images")
  File.new(File.join(base_path, "#{attachment}.#{extension}"))
end

FactoryGirl.define do
  sequence :email do |n| 
    "email#{n}@factory.com"
  end 

  factory :item do
    name "My great item"
    description "My great item"
    price 1000
    percentage 10
    nonprofit
    seller { create :user }
    category
    image
  end

  factory :nonprofit do
    email
    info "A wonderful charity that will benefit you greatly."
    name "WWF"
    website "wwf.org"
  end

  factory :user do
    email
    first_name { 'Dylan' }
    last_name { 'Drop' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :authentication do
    uid '1234'
    token 'something'
    secret 'somethingelse'
  end

  factory :image do
    content { paperclip_fixture('image', 'rails', 'png') }
  end

  factory :category do
    name { 'Cat1' }
  end
end