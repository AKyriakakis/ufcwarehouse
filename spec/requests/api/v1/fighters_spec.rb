require 'rails_helper'

RSpec.describe 'Api::V1::Fighters', type: :request do
  describe 'GET /api/v1/fighters' do
    it 'returns all fighters' do
      expected_fighters_num = 4
      expected_included_str = 'fighters'

      get api_v1_fighters_path

      expect(response.body).to include(expected_included_str)
      expect(JSON.parse(response.body)['data']['fighters'].size).to eq(expected_fighters_num)
      expect(response).to have_http_status(:successful)
    end
  end
end
