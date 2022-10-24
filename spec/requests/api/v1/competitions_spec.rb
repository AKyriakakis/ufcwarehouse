require 'rails_helper'

RSpec.describe 'Api::V1::Competitions', type: :request do
  describe 'GET /api/v1/competitions' do
    it 'returns all competitions' do
      expected_message = 'Loaded Competitions'

      get api_v1_competitions_path

      expect(response).to have_http_status(:successful)
      expect(JSON.parse(response.body)['message']).to eq(expected_message)
    end
  end
end
