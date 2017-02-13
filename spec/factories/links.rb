FactoryGirl.define do
  factory :link do

    sequence(:title, 1000) { |n| "awesome title #{n}" }
    sequence(:url, 1000) { |n| "https://www.exapmle.com/#{n}/" }
  end
end
