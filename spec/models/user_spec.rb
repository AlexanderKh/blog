require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    before :each do
      @user = User.new
    end

    it 'should require a username' do
      expect(@user).to be_invalid
      expect(@user.errors).not_to be_nil
    end
  end
end
