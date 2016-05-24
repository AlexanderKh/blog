require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Validations' do
    it { should validate_presence_of :article }
    it { should validate_presence_of :content }
  end
end