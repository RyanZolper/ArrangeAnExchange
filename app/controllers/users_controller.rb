class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def welcome
    @user= User.new
    @random = Faker::Number.number(10)
    session[:temp] = @random
  end


  def show
  end

  def mysaves
    @user= User.new
    @random = Faker::Number.number(10)
    @temp = @random
    @fams = @current_user.saves.order("created_at DESC").page params[:page]
  end

  def signup
    if session[:current_user_id] != nil
      session[:current_user_id] = nil
    end
    @user = User.new
  end

  def setupme
  end


  def savefam
    @fam = Family.find(params[:family_id])
    @current_user.saves << @fam
    respond_to do |format|
      format.js
    end
  end

  def unsavefam
    @fam = @current_user.saves.find(params[:family_id])
    @current_user.saves.delete(@fam)
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end

  def connect
    @user = User.find(params[:user_id])
    @fam = Family.find(params[:fam_id])
    @content = params[:content]
    UserMailer.connect_email(@user, @fam, @content).deliver_later
    redirect_to :back, notice: "Message Sent!"
  end

  def host_review
    @user = User.find(params[:user_id])
    @fam = Family.find(params[:fam_id])
    @review = params[:review]
    @rating = (params[:ratefam].to_i)
    @trav = Traveler.find(params[:trav_id])
    UserMailer.host_review_email(@user, @trav, @fam, @review, @rating).deliver_later
    redirect_to :back, notice: "Message Sent"
  end


  def create
    @user = User.new(user_params)
    @temp = session[:temp]
    if @user.save(user_params)
      render js: %(window.location.pathname='#{users_check_email_path}')
      UserMailer.signup_email(@user, @temp).deliver_later
      session[:current_user_id] = @user.id
    else
      flash[:alert] = "#{@user.errors.full_messages.to_sentence}"
      respond_to do |format|
        format.js
      end
    end
  end


  def loginpage
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      render js: %(location.reload())
      flash[:notice] = "Login Success!"
      session[:current_user_id] = @user.id
    else
      flash[:alert] = "Incorrect Password"
      respond_to do |format|
        format.js
      end
    end
  end

  def logout
    session.delete :current_user_id
    redirect_to root_path, notice: "Logged Out"
  end

  def account
    @user = @current_user
  end

  def firstloginpage
    @user = User.new
  end

  def firstlogin
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      redirect_to users_changepwdpage_path
      @user.update_attribute('changedpwd', 'true')
      session[:current_user_id] = @user.id
    else redirect_to :back, alert: "Try Again"
    end
  end

  def changepwdpage
    @user = @current_user
  end

  def changepwd
    if @user.update(user_params)
      redirect_to users_setupme_path
    else redirect_to :back, alert: "Try Again"
    end
  end

  def updatepage
    @user = @current_user
  end


  def update
    @user = @current_user
      if @user.update(user_params)
        redirect_to users_account_path, notice: "Account Info Changed!"
      else
        redirect_to :back, alert: 'Try again!'
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Account Deleted.'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :family_id, :country, :admin)
    end
end
