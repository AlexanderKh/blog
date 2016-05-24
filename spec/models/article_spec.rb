require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :user }
    it { should validate_length_of(:content).is_at_least(10) }
  end

  context 'Initialization' do
    let(:article) { create :article }

    it '#create' do
      expect(article).to be_an_instance_of Article
    end
  end
end