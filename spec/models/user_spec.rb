require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :role }
  end

  context 'Initialization' do
    it 'should set role to user automatically' do
      user = User.create(username: 'test', password: 'q1w2e3r4')
      expect(user.role).to eq 'user'
    end
  end

  context 'Permissions' do
    let(:admin) { create :admin }
    let(:user_1) { create :user }
    let(:user_2) { create :user, username: 'johndoe' }
    let(:article) { create :article }
    let(:admin_article) { create :admin_article }
  end
end
