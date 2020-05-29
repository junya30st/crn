require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe Blog do 
    describe '#create' do

      context 'can save' do
        it 'imageがなくても投稿できる' do
          blog = build(:blog, image: "")
          expect(blog).to be_valid
        end
      end
    end
  end
end
