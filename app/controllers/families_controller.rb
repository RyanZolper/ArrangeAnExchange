class FamiliesController < ApplicationController

  def home
    if @current_user != nil
      @famils = Family.where.not(id: @current_user.family_id)
    else
      @famils = Family.all
    end

    if params[:q]
      @fams = @famils.search([params[:q], params[:s]]).order("created_at DESC").page params[:page]
    else
      @fams = @famils.order("created_at DESC").page params[:page]
    end
  end

  def showfam
    @fam = Family.find(params[:id])
    @fam_attachments = @fam.fam_attachments.all
    @hosteds = @fam.hosteds.all
    @rated = @hosteds.average(:hoststars).to_f
  end

  def myfam
    @fam = @current_user.family
    @fam_attachments = @fam.fam_attachments.all
  end

  def setup
    @fam = Family.new
    @fam_attachment = @fam.fam_attachments.build
  end

  def create
    @fam = Family.new(fam_params)
    if @fam.save && params[:fam_attachments] != nil
      params[:fam_attachments]['image'].each do |a|
        @pichold = @fam.fam_attachments.create!(:image => a, :family_id => @fam.id)
      end
      @fam.update_attribute('features', params[:family][:features])
      @current_user.update_attribute('family_id', @fam.id)
      @current_user.travelers.each do |x|
        x.update_attribute('family_id', @fam.id)
      end
      redirect_to families_home_path
    elsif @fam.save
      @fam.update_attribute('features', params[:family][:features])
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
        params.require(:family).permit(:name, :profpic, :housepic, :bio, :tagline, :hostdates, :pvtbed, :pvtbath, :beds, :baths, :size, :lifehere, :features, :attracts, :country, :city, :address, :age_range, :morepics, :smokers, :env)
      end



end
