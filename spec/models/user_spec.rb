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

      end
    end

    # describe '.authenticate_with_credentials' do
    #   # examples for this class method here
    # end
end
