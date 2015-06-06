class TravelersController < ApplicationController

  def setup
    @trav = Traveler.new
  end

  def create
    @trav = @current_user.travelers.new(trav_params)
    if @trav.save
      if session[:firsts] == nil
        redirect_to families_home_path
      else
        redirect_to users_thanks_path
      end
    else redirect_to :back, alert: 'Try again!'
    end
  end

  def showtrav
    @trav = Traveler.find(params[:id])
  end

  def mytrav
    @travs = @current_user.family.travelers.all
  end

  def updatepage
    @trav = Traveler.find(params[:id])
  end

  def update
    @trav = Traveler.find(params[:id])
      if @trav.update(trav_params)
        if session[:firsts] == nil
          redirect_to travelers_mytrav_path, notice: "Updated #{@trav.name}!"
        else
          redirect_to users_thanks_path, notice: "Update #{@trav.name}"
        end
      else
        redirect_to :back, alert: 'Try again!'
      end
  end





  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def trav_params
      params.require(:traveler).permit(:name, :sex, :age, :destinations, :pic, :trvldates, :bio, :tagline, :family_id, :user_id)
    end


end
