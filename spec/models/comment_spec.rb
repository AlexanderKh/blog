require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Validations' do
    it { should validate_presence_of :article }
    it { should validate_presence_of :content }
  end

  context 'Sorting' do
    let(:user) { create :user }
    let(:article) { create :article, user: user }

    it 'should sort comments from last added' do
      c1 = create :comment, user: user, article: article
      c2 = create :comment, user: user, article: article
      c3 = create :comment, user: user, article: article
      expect(Comment.all).to eq [c3, c2, c1]
    end
  end
end