require 'rails_helper'

RSpec.describe Article, type: :model do

  let(:article) { create :article }

  it 'should do something' do
    expect(article).to be_an_instance_of Article
  end
end