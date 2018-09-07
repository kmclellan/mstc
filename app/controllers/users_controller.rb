# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.usertype_id == 1
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'An activation request email has been sent to the newly created user.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'User information has been successfully updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User has been successfully deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:firstname,
                                 :lastname,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :usertype_id,
                                 :address,
                                 :tel_home,
                                 :tel_mob)
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.usertype_id == 1
  end

  def admin_user
    redirect_to(root_url) unless current_user.usertype_id == 1
  end
end
