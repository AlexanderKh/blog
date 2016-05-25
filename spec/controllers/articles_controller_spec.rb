require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create :user }
  let(:article) { create(:article, user: user) }
  subject { response }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe '#index' do
    before { get :index }

    it { is_expected.to have_http_status :success }
  end

  describe '#show' do
    before { get :show, {id: article.id} }

    it { is_expected.to have_http_status :success }
  end

  describe '#create' do
    let(:article_attributes) { attributes_for :article }

    before { post :create, {article: article_attributes} }

    it { is_expected.to have_http_status :created }

    context 'invalid data' do
      let(:article_attributes) { attributes_for :article, title: '' }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end

  describe '#update' do
    let!(:article) { create :article, user: user }
    let(:article_params) { attributes_for :article, title: 'example title'  }

    before { patch :update, { id: article.id, article: article_params } }

    it { is_expected.to have_http_status :success }

    context 'invalid params' do
      let(:article_params) { attributes_for :article, title: '' }

      it { is_expected.to have_http_status :unprocessable_entity }
    end
  end

  describe '#destroy' do
    before { delete :destroy, { id: article.id } }

    it { is_expected.to have_http_status :found }
  end
end
