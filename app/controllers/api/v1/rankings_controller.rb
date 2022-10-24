module Api
  module V1
    class RankingsController < ApplicationController
      @@url = 'https://api.sportradar.com/mma/trial/v2/en/rankings.json?api_key='
      @@apiKey = 'zcu4q35cfnk3f46ssbabbq27'

      def index
        @response = HTTParty.get(@@url + @@apiKey, headers: { 'Content-Type' => 'application/json' })
        @rankings = @response.parsed_response
        render json: { status: 'SUCCESS', message: 'Loaded Rankings', data: @rankings }, status: :ok
      end
    end
  end
end
