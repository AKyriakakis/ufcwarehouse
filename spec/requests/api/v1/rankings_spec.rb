require 'rails_helper'

RSpec.describe 'Api::V1::Rankings', type: :request do
  describe 'GET /api/v1/rankings' do
    it 'returns all rankings' do
      expected_message = 'Loaded Rankings'

      get api_v1_rankings_path

      expect(response).to have_http_status(:successful)
      expect(JSON.parse(response.body)['message']).to eq(expected_message)
    end
  end
end
