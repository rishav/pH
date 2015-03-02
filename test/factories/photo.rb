FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('assets', 'images', 'missing.png'), 'image/png') }
    pizza_location      
  end
end