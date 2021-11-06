require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    subject { Post.new title: 'Post 1', user_id: 0 }

    before { subject.save }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    
    it 'should not have a blank title' do
      subject.title = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a title length of not more than 250 characters' do
      subject.title = 'Sample text' * 250
      expect(subject).to_not be_valid
    end

    it 'should have a comments counter greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have a likes counter greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
