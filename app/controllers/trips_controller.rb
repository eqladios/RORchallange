class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.build
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = current_user.trips.build(trip_params)
    @trip.users << current_user #User Join their own trip
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @trip = Trip.find(params[:id])
    @m = @trip.memberships.build(:user_id => current_user.id)
    respond_to do |format|
      if @m.save
        format.html { redirect_to(@trip, :notice => 'You have joined this trip.') }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { redirect_to(@trip, :notice => 'Join error.') }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotUnique
    respond_to do |format|
    format.html { redirect_to(@trip, :notice => 'You already joined this trip!') }
    format.json { render json: @trip.errors, status: :unprocessable_entity }
    end
  end

  def unjoin
    @trip = Trip.find(params[:id])
    @m = @trip.memberships.find_by!(params[:user_id => current_user.id])
    @m.destroy
    flash[:notice] = "You have unjoined this trip."
        redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:time, :date, :source, :destination)
    end
end
