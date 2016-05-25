FactoryGirl.define do
  factory :comment do
    user
    article
    content 'Wow, such breaking'
  end
end