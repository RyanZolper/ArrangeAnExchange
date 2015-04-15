class FamiliesController < ApplicationController

  def home
    @random = Faker::Number.number(10)
    @temp = @random
    @user = User.new
    if @current_user != nil
      @famils = Family.showing.where.not(id: @current_user.family_id)
    else
      @famils = Family.showing
    end

    if params[:q]
      @fams = @famils.includes(:connections).search([params[:q], params[:s]]).order("created_at DESC").page params[:page]
    else
      @fams = @famils.includes(:connections).order("created_at DESC").page params[:page]
    end
  end

  def showfam
    @fam = Family.includes(:connections, :hosteds).find(params[:id])
    @fam_attachments = @fam.fam_attachments.order("created_at DESC")
    @hosteds = @fam.hosteds.all
    @rate20 = ((@hosteds.average(:hoststars).to_f) * 4).to_i
    if (((@rate20) / 4.0 ) % 1) == 0
      @rate5 = (((@rate20) / 4.0 ).to_i)
    else
      @rate5 = ((@rate20) / 4.0 )
    end
  end

  def myfam
    @fam = @current_user.family
    @fam_attachments = @fam.fam_attachments.order("created_at DESC")
    @hosteds = @fam.hosteds.all
    @rate20 = ((@hosteds.average(:hoststars).to_f) * 4).to_i
    if (((@rate20) / 4.0 ) % 1) == 0
      @rate5 = (((@rate20) / 4.0 ).to_i)
    else
      @rate5 = ((@rate20) / 4.0 )
    end
  end

  def show
    @current_user.family.update_attribute('showing', true)
    respond_to do |format|
      format.js
    end
  end

  def hide
    @current_user.family.update_attribute('showing', false)
    respond_to do |format|
      format.js
    end
  end

  def updatepage
    @fam = @current_user.family
  end

  def update
    @fam = @current_user.family
      if @fam.update(fam_params) && params[:fam_attachments] != nil
        fa = 0
        params[:fam_attachments]['image'].each do |a|
          unless a == ""
            @fam.fam_attachments[fa].update_attribute('image', a.to_s)
          end
          fa += 1
        end
        redirect_to families_myfam_path, notice: 'Family Updated!'
      else
        if @fam.update(fam_params)
          if params[:region] != ""
            @fam.city << ", "
            @fam.city << params[:region]
          end
          @fam.update_attribute('features', params[:family][:features])
          if params[:otherfts] != ""
            @fam.features << params[:otherfts]
          end
          redirect_to families_myfam_path, notice: 'Family Updated!'
        else
          redirect_to :back, alert: 'Try again!'
        end
      end
  end


  def setup
    @fam = Family.new
    @fam_attachment = @fam.fam_attachments.build
  end

  def create
    @fam = Family.new(fam_params)
    if params [:region] != ""
      @fam.city << ", "
      @fam.city << params[:region]
    end
    if @fam.save && params[:fam_attachments] != nil
      params[:fam_attachments]['image'].each do |a|
        @pichold = @fam.fam_attachments.create!(:image => a, :family_id => @fam.id)
      end
      @fam.update_attribute('features', params[:family][:features])
      if params[:otherfts] != ""
        @fam.features << params[:otherfts]
      end
      @current_user.update_attribute('family_id', @fam.id)
      @current_user.travelers.each do |x|
        x.update_attribute('family_id', @fam.id)
      end
      redirect_to families_home_path
    elsif @fam.save
      @fam.update_attribute('features', params[:family][:features])
      if params[:otherfts] != ""
        @fam.features << params[:otherfts]
      end
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
        params.require(:family).permit(:name, :profpic, :housepic, :bio, :tagline, :hostdates, :pvtbed, :pvtbath, :beds, :baths, :size, :lifehere, :features, :attracts, :country, :city, :address, :age_range, :morepics, :smokers, :env, :showing, :fam_attachments_attributes => [:id, :image])
      end



end
