require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'test name presence' do
      user = User.new(email: 'kalu@gmail.com', password: '123456').save
      expect(user).to eq(false)
    end
    it 'test email address presence' do
      user = User.new(name: 'chinasa', email: '', password: '123467').save
      expect(user).to eq(false)
    end

    it 'test password presence' do
      user = User.new(name: 'chinasa', email: 'kalu@gmail.com', password: '').save
      expect(user).to eq(false)
    end

    it 'test password length ' do
      user = User.new(name: 'chinasa', email: 'kalu@gmail.com', password: '12367').save
      expect(user).to eq(false)
    end

    it 'test name length ' do
      user = User.new(name: 'chinasa agu kalu david', email: 'kalu@gmail.com', password: '12367').save
      expect(user).to eq(false)
    end

    it 'should save successfully ' do
      user = User.new(name: 'chinasa', email: 'kalu@gmail.com', password: '1234567').save
      expect(user).to eq(true)
    end
  end

  context 'Association test' do
    it 'should have many posts' do
      user = User.reflect_on_association(:posts).macro
      expect(user).to eq(:has_many)
    end

    it 'Should have many comments' do
      user = User.reflect_on_association(:comments).macro
      expect(user).to eq(:has_many)
    end

    it 'Should have many Likes' do
      user = User.reflect_on_association(:likes).macro
      expect(user).to eq(:has_many)
    end

    it 'Should have many Friendships' do
      user = User.reflect_on_association(:friendships).macro
      expect(user).to eq(:has_many)
    end

    it 'Should have many Friends' do
      user = User.reflect_on_association(:friends).macro
      expect(user).to eq(:has_many)
    end

    it 'Should have many Inverse_Friendships' do
      user = User.reflect_on_association(:inverse_friendships).macro
      expect(user).to eq(:has_many)
    end
  end
end
