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
    let(:user) { create :user }
    let(:admin) { create :admin }
    let(:article) { create :article, user: user }
    let(:admin_article) { create :article, user: admin }
    let(:comment) { create :comment, article: article, user: user }
    let(:admin_comment) { create :comment, article: article, user: admin }

    context 'Admin' do
      it 'should have access to all articles' do
        expect(admin.has_access_to?(article)).to be true
        expect(admin.has_access_to?(admin_article)).to be true
      end

      it 'should have access to all comments' do
        expect(admin.has_access_to?(comment)).to be true
        expect(admin.has_access_to?(admin_comment)).to be true
      end
    end

    context 'User' do
      it 'should have access only to own articles' do
        expect(user.has_access_to?(article)).to be true
        expect(user.has_access_to?(admin_article)).to be false
      end

      it 'should have access only to own comments' do
        expect(user.has_access_to?(comment)).to be true
        expect(user.has_access_to?(admin_comment)).to be false
      end
    end
  end
end
