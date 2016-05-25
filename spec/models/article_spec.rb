require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :user }
    it { should validate_length_of(:content).is_at_least(10) }
  end

  context 'Sorting' do
    let(:user) { create :user }
    it 'should sort articles from last added' do
      a1 = create :article, user: user
      a2 = create :article, user: user
      a3 = create :article, user: user
      expect(Article.all).to eq [a3, a2, a1]
    end
  end

  context 'Pictures' do
    it 'should create article with picture' do
      article = create :article, picture: File.new("#{Rails.root}/spec/factories/image_1.jpg")
      expect(article).to be_valid
    end
  end
end