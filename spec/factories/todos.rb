FactoryGirl.define do

  factory :todo do
    title "Finish an interview project"
    remark "I should finish it quickly, with good code quality"

    #factory :todo_important do
    #  is_important true
    #end

    #factory :todo_high_primary do
    #  primary 0
    #end
  end
end