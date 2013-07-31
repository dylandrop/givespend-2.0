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

  factory :category do
    name { 'Cat1' }
  end
end