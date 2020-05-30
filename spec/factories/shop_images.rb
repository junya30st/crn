FactoryBot.define do
  factory :shop_image do
    image            {Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/noImage.png'))}
    association :shop
  end
end
