FactoryGirl.define do
  factory :event do
    name 'Navidad'
    address 'Madrid 28012'
    start_at Time.now
    end_at Time.now + 2.day
  end

end
