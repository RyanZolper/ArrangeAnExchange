class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def mysaves
    @fams = @current_user.saves
  end

  def signup
    if session[:current_user_id] != nil
      session[:current_user_id] = nil
    end
    @user = User.new
    @random = Faker::Number.number(10)
    @temp = @random
  end

  def setupme
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  def savefam
    @newfav = Family.find(params[:family_id])
    @current_user.saves << @newfav
    redirect_to :back
  end

  def unsavefam
    @fam = @current_user.saves.find(params[:family_id])
    @current_user.saves.delete(@fam)
    redirect_to :back
  end

  def connect
    @user = User.find(params[:user_id])
    @fam = Family.find(params[:fam_id])
    @content = params[:content]
    UserMailer.connect_email(@user, @fam, @content).deliver_later
    redirect_to :back, notice: "Message Sent!"
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @temp = params[:temp]
    if @user.save
      UserMailer.signup_email(@user, @temp).deliver_later
      session[:current_user_id] = @user.id
      redirect_to users_check_email_path
    else
      redirect_to 'users/signup', alert: "Try again, errors: #{@user.errors}"


    end
  end

  def loginpage
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      redirect_to families_home_path, notice: "Login Success!"
      session[:current_user_id] = @user.id
    else redirect_to :back, alert: "Try Again"
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



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = @current_user
      if @user.update(user_params)
        redirect_to travelers_setup_path
      else
        redirect_to :back, alert: 'Try again!'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :family_id, :country)
    end
end
