FactoryBot.define do
  factory :access_token do
    # token { "MyString" }
    # user { nil }
    #Token is generated after initialization
    association :user
  end
end
