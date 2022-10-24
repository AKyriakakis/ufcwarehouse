module Api
  module V1
    class FightersController < ApplicationController
      def index
        fighters = Fighter.order('name')
        render json: { status: 'SUCCESS', message: 'Loaded fighters', data: { fighters: } }, status: :ok
      end

      def show
        fighter = Fighter.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded fighter', data: { fighter: } }, status: :ok
      end

      def create
        fighter = Fighter.new(fighter_params)

        if fighter.save
          render json: { status: 'SUCCESS', message: 'Saved fighter', data: { fighter: } }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Fighter not saved', data: fighter.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        fighter = Fighter.find(params[:id])
        fighter.destroy
        render json: { status: 'SUCCESS', message: 'Deleted fighter', data: fighter }, status: :ok
      end

      def update
        fighter = Fighter.find(params[:id])

        if fighter.update(fighter_params)
          render json: { status: 'SUCCESS', message: 'Updated fighter', data: { fighter: } }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Fighter not updated', data: fighter.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def fighter_params
        params.permit(:name, :nickname, :age, :weightclass, :rank)
      end
    end
  end
end
