class FamiliesController < ApplicationController

  def home
    if params[:q]
      @fams = Family.search([params[:q], params[:s]]).order("created_at DESC")
    else
      @fams = Family.order("created_at DESC")
    end
  end

  def showfam
    @fam = Family.find(params[:id])
  end

  def setup
    @fam = Family.new
  end

  def create
    @fam = Family.new(fam_params)
    if @fam.save
      @current_user.update_attribute('family_id', @fam.id)
      @current_user.travelers.each do |x|
        x.update_attribute('family_id', @fam.id)
      end
      redirect_to families_home_path
    else redirect_to :back, alert: "Try again!"
    end
  end









    private
      # Use callbacks to share common setup or constraints between actions.

      # Never trust parameters from the scary internet, only allow the white list through.
      def fam_params
        params.require(:family).permit(:name, :profpic, :housepic, :bio, :tagline, :hostdates, :pvtbed, :pvtbath, :beds, :baths, :size, :lifehere, :features, :attracts, :country, :city, :address, :age_range, :morepics)
      end



end
