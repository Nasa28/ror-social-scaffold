require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Association' do
    it 'Should Belong to User' do
      friend = Friendship.reflect_on_association(:user).macro
      expect(friend).to eq(:belongs_to)
    end

    it 'Should belong to friend' do
      friend = Friendship.reflect_on_association(:friend).macro
      expect(friend).to eq(:belongs_to)
    end
  end
end
