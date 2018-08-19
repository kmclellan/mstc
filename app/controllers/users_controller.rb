class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "New user creation has been successful."
      redirect_to @user
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
      flash[:success] = "User information has been successfully updated."
      redirect_to @user

    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname,
                                   :lastname,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
