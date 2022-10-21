module Api
    module V1
        class CompetitionsController < ApplicationController

          @@url = 'https://api.sportradar.com/mma/trial/v2/en/competitions.json?api_key='
          @@apiKey = 'zcu4q35cfnk3f46ssbabbq27'

          def index
            @response = HTTParty.get(@@url + @@apiKey, :headers => { 'Content-Type' => 'application/json' })
            @competitions = @response.parsed_response
            p @response.keys
            render json: { status: 'SUCCESS', message: 'Loaded Competitions', data: @competitions }, status: :ok
          end

        end
    end
end
