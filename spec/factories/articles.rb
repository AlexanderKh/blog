FactoryGirl.define do
  factory :article do
    user
    title 'Mere Paper'
    content 'Lorem ipsum'
  end

  factory :admin_article, class: Article do
    user admin
    title 'Admin Paper'
    content 'Lorem ipsum'
  end
end