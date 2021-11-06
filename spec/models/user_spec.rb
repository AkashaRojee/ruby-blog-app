require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { User.new name: 'John Smith' }

    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
        
    it 'should not have a blank name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a integer posts counter greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
