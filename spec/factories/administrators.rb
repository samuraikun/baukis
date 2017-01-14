FactoryGirl.define do
  factory :administrator do
    email 'administrator@example.com'
    password 'foobar'
    suspended false
  end
end
