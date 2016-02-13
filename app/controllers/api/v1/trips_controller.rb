module Api
  module V1
    class TripsController < ApplicationController
      # GET /trips
      # GET /trips.json
      def index
        @trips = Trip.all
      end

      # GET /trips/new
      def new
        @trip = Trip.new
      end

      # POST /trips
      # POST /trips.json
      def create
        @trip = Trip.new(trip_params)
        if @trip.save
          render json: @trip, status: :created
        else
          render json: @trip.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_trip
          @trip = Trip.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def trip_params
          params.permit(:time, :date, :source, :destination, :user_id)
        end
    end
  end
end
