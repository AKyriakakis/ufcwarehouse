require 'rails_helper'

RSpec.describe 'Api::V1::Fighter', type: :request do
  describe 'GET /api/v1/fighters/{id}' do
    it 'returns a fighter' do
      fighter_id = 1
      expected_name = 'Dustin Poirier'

      get api_v1_fighter_path(id: fighter_id)

      expect(response).to have_http_status(:successful)
      expect(JSON.parse(response.body)['data']['fighter']['name']).to eq(expected_name)
    end
  end

  describe 'POST /api/v1/fighters/{fighter_params}' do
    it 'creates a fighter' do
      sample_fighter = {
        "name": 'Valentina Shevchenko',
        "nickname": 'Bullet',
        "age": 34,
        "created_at": '2022-10-22T21:28:41.923Z',
        "updated_at": '2022-10-23T00:31:36.230Z',
        "rank": 0,
        "weightclass": 'Bantamweight'
      }
      expected_name = 'Valentina Shevchenko'

      post api_v1_fighters_path, params: sample_fighter

      expect(response).to have_http_status(:successful)
      expect(JSON.parse(response.body)['data']['fighter']['name']).to eq(expected_name)
    end
  end

  describe 'POST /api/v1/fighters missing age' do
    it 'fails to create a fighter' do
      sample_fighter = {
        "name": 'Valentina Shevchenko',
        "nickname": 'Bullet',
        "created_at": '2022-10-22T21:28:41.923Z',
        "updated_at": '2022-10-23T00:31:36.230Z',
        "rank": 0,
        "weightclass": 'Bantamweight'
      }
      expected_error = 'Fighter not saved'

      post api_v1_fighters_path, params: sample_fighter

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include(expected_error)
    end
  end

  describe 'DELETE /api/v1/fighters/{id}' do
    it 'deletes a fighter' do
      fighter_id = 1
      expected_name = 'Dustin Poirier'
      expected_message = 'Deleted fighter'

      delete api_v1_fighter_path(id: fighter_id)

      expect(response).to have_http_status(:successful)
      expect(response.body).to include(expected_message)
      expect(JSON.parse(response.body)['data']['name']).to eq(expected_name)
    end
  end

  describe 'PUT /api/v1/fighters/{id}' do
    it 'updates a fighter' do
      sample_fighter = {
        "name": 'Valentina Shevchenko',
        "nickname": 'Bullet',
        "created_at": '2022-10-22T21:28:41.923Z',
        "updated_at": '2022-10-23T00:31:36.230Z',
        "rank": 0,
        "weightclass": 'Bantamweight'
      }
      fighter_id = 1
      expected_nickname = 'Bullet'
      expected_message = 'Updated fighter'

      put api_v1_fighter_path(id: fighter_id), params: sample_fighter

      expect(response).to have_http_status(:successful)
      expect(response.body).to include(expected_message)
      expect(JSON.parse(response.body)['data']['fighter']['nickname']).to eq(expected_nickname)
    end
  end
end
