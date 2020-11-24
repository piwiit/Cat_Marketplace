class UsersController < ApplicationController
  before_action :authenticate_user!

  # Flo : Le controlleur n'a pas ecnore été testé, en attente des views.

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(firstname: params[:firstname], lastname: params[:lastname], age: params[:age], encrypted_password: params[:encrypted_password], password_confirmation: params[:password_confirmation])
    if @user.save
      log_in(@user) # La méthode est dans le users_helper.rb
      flash[:notice_good] = "Connexion réussi"
      redirect_to root_path
    else 
      flash[:notice_bad] = "Erreur de connexion"
      render 'new'
    end 
  end

  def edit
    @user_to_edit = User.find(params[:id])
  end

  def update
    @user_to_edit = User.find(params[:id])
    post_params = params.require(:user).permit(:firstname, :lastname, :age, :encrypted_password, :password_confirmation)
    @user_to_edit.update(post_params)
    redirect_to root_path
  end

  def destroy
    @user = Event.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  
end
