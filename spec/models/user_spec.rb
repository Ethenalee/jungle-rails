require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
      it 'has a name' do
        record = User.new
        record.name = '' # invalid state
        record.valid?
        expect(record.errors[:name]).to include "can't be blank"

        record.name = 'foo'
        record.valid?
        expect(record.errors[:name]).to include "Need first and last name"

        record.name = 'foo boo'
        record.valid?
        expect(record.errors[:name]).not_to include 'AError'
      end

    it 'has a password' do
      record = User.new
      record.name = 'foo boo'
      record.password = '' # invalid state
      record.valid?
      expect(record.errors[:password]).to include "can't be blank"

      record.password = 'fooboo'
      record.valid?
      expect(record.errors[:password]).not_to include "can't be blank"

      record.password_confirmation = '' # invalid state
      record.valid?
      expect(record.errors[:password_confirmation]).to include "can't be blank"

      record.password_confirmation = 'foo' # invalid state
      record.valid?
      expect(record.errors[:password_confirmation]).to include "doesn't match Password"

      record.password_confirmation = 'fooboo' # invalid state
      record.valid?
      expect(record.errors[:password_confirmation]).not_to include 'AError'
    end

    it 'has a email' do
      record = User.new
      record.name = 'foo boo'
      record.password = 'fooboo'
      record.password_confirmation = 'fooboo'

      record.email = '' # invalid state
      record.valid?
      expect(record.errors[:email]).to include "can't be blank"

      record1 = User.new
      record1.name = 'foo boo'
      record1.password = 'fooboo'
      record1.password_confirmation = 'fooboo'
      record1.email = 'test@text.com' # invalid state
      saved = record1.save
      expect(saved).to eql(true)
      record1.valid?
      expect(record1.errors[:email]).not_to include 'AError'

      record2 = User.new
      record2.name = 'foo boo'
      record2.password = 'fooboo'
      record2.password_confirmation = 'fooboo'
      record2.email = 'test@text.com' # invalid state
      record2.valid?
      expect(record2.errors[:email]).to include 'has already been taken'

      record2 = User.new
      record2.name = 'foo boo'
      record2.password = 'fooboo'
      record2.password_confirmation = 'fooboo'
      record2.email = 'TEST@text.com' # invalid state
      record2.valid?
      expect(record2.errors[:email]).to include 'has already been taken'

    end

    it 'password length' do
      record = User.new
      record.name = 'foo boo'
      record.password = 'fffff' # invalid state
      record.valid?
      expect(record.errors[:password]).to include "is too short (minimum is 6 characters)"

      record.password = 'fffffffffffff' # invalid state
      record.valid?
      expect(record.errors[:password]).to include "is too long (maximum is 12 characters)"

      record.password = 'fooboo' # invalid state
      record.valid?
      expect(record.errors[:password]).not_to include 'AError'

    end
  end

  describe 'authenticate_with_credentials' do
    it 'email validation' do
      record1 = User.new
      record1.name = 'foo boo'
      record1.password = 'fooboo'
      record1.password_confirmation = 'fooboo'
      record1.email = 'ethena@text.com' # invalid state
      saved = record1.save
      expect(saved).to eql(true)

      expect(User.authenticate_with_credentials('ethena@text.com', 'fooboo')).to be_present
      expect(User.authenticate_with_credentials('Ethena@text.com', 'fooboo')).to be_present
      expect(User.authenticate_with_credentials(' Ethena@text.com', 'fooboo')).to be_present
    end
  end

    
end
