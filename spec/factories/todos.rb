FactoryGirl.define do

  factory :todo do
    title "Finish an interview project"
    remark "I should finish it quickly, with good code quality"

    factory :todo_archived do
      status :archived
    end
  end
end