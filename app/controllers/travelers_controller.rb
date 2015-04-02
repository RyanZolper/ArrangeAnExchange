class TravelersController < ApplicationController

  def setup
    @trav = Traveler.new
  end

  def create
    @trav = Traveler.new(trav_params)
    if @trav.save
      redirect_to families_setup_path
    else redirect_to :back, alert: 'Try again!'
    end
  end









  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def trav_params
      params.require(:traveler).permit(:name, :age, :destinations, :trvldates, :bio, :tagline, :family_id)
    end


end
