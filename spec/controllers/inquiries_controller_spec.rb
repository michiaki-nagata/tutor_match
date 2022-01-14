require 'rails_helper'

RSpec.describe InquiriesController, type: :request do
  let(:inquiry) { create(:inquiry) }

  describe '#index' do
    it 'response success' do
      get inquiries_path
      expect(response.status).to eq(200)
    end
  end
  
  describe 'show' do
    it 'response success' do  
      get inquiry_path(inquiry)
      expect(response.status).to eq(200)
    end 
  end
    
  describe '#new' do
    it 'response success' do
      get new_inquiry_path
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'create inquiry' do
        inquiry_params = FactoryBot.attributes_for(:inquiry)
        expect{
            post inquiries_path, params:{ inquiry: inquiry_params}
        }.to change(Inquiry, :count).by(1)
    end
  end
end
