FactoryGirl.define do
  factory :user do
    username 'nana'
    password 'q1w2e3r4'
    role     :user
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    username 'admin'
    password 'q1w2e3r4'
    role     :admin
  end
end