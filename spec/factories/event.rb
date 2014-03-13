FactoryGirl.define do
  factory :event do
    name 'Navidad'
    address 'Madrid 28012'
    start_at 1.day.from_now
    end_at 2.days.from_now

    association :user
  end

end
