FactoryGirl.define do

  sequence(:email) {|i| "sample_#{i}@email.com" }

  factory :user do
    email { generate(:email) }
    password "password"

    factory :user_with_todos do
      after(:create) do |user|
        FactoryGirl.create(:todo, title: 'sample active todo', user: user)
        FactoryGirl.create(:todo, title: 'sample archived todo', user: user, status: Todo.statuses[:archived])
      end
    end
  end
end