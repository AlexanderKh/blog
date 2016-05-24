FactoryGirl.define do
  factory :article do
    user
    title 'Mere Paper'
    content 'Lorem ipsum'
    picture { File.new("#{Rails.root}/spec/factories/image_1.jpg") }
  end

  factory :admin_article, class: Article do
    user admin
    title 'Admin Paper'
    content 'Lorem ipsum'
    picture { File.new("#{Rails.root}/spec/factories/image_1.jpg") }
  end
end