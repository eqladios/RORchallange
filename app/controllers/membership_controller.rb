class MembershipsController < ApplicationController
  before_filter :authenticate_user!

    def create
      @membership = current_user.memberships.build(:trip_id => params[:trip_id])
      if @membership.save
        flash[:notice] = "You have joined this trip."
        redirect_to :back
      else
        flash[:error] = "Unable to join."
        redirect_to :back
      end
    end

    def destroy
      @membership = current_user.memberships.find(params[:id])
      @membership.destroy
      flash[:notice] = "Removed membership."
          redirect_to :back
    end

end
