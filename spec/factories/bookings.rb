FactoryGirl.define do
  factory :booking do
    flight_id { create(:flight).id }
    booking_reference "1234"
    booking_fee 40.00
    passenger_email "passenger@gmail.com"
    users_id "2"
  end
end
