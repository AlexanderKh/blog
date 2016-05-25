require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:article) { create(:article, user: user) }
  let(:comment) { create(:comment, user: user, article: article) }
  let(:attributes) { {article_id: article.id, format: 'json'} }
  subject { response }

  before { sign_in user }

  describe '#create' do
    let(:comment_attributes) { attributes_for :comment }

    before { post :create, attributes.merge({comment: comment_attributes}) }

    it { is_expected.to have_http_status :created }

    context 'invalid data' do
      let(:comment_attributes) { attributes_for :comment, content: '' }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end

  describe '#update' do
    let(:comment_attributes) { attributes_for :comment, content: 'be be be' }

    before { patch :update, attributes.merge({ id: comment.id, comment: comment_attributes }) }

    it { is_expected.to have_http_status :ok }

    context 'invalid data' do
      let(:comment_attributes) { attributes_for :comment, content: '' }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end

  describe '#destroy' do
    before { delete :destroy, attributes.merge({ id: comment.id }) }

    it { is_expected.to have_http_status :no_content }
  end
end
