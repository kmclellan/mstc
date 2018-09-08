# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user,   only: %i[edit show update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
   end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Attention! An activation request email has been sent.'
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
      flash[:success] = 'Success! User information has been updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Success! User has been been deleted.'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:firstname,
                                 :lastname,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = 'Error! Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = 'Error! Attempted action has been denied.'
      redirect_to(root_url)
    end
  end

  def admin_user
    @admin = Admin.where(user_id: current_user.id)
    if @admin.empty?
      flash[:danger] = 'Error! Attempted action has been denied.'
      redirect_to(root_url)
    end
  end
end
