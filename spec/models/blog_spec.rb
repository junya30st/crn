require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe user do 
    describe '#create' do

      context 'can save' do
        it 'imageがなくても投稿できる'
          blog = build(:blog, image: "")
          expect(blog).to be_valid
      end
    end
  end
end
