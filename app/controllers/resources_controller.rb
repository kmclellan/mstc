class ResourcesController < ApplicationController
  before_action :admin_user,   only: %i[new index edit update destroy]

  def index
    @resources = Resource.paginate(page: params[:page])
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = "Success! New resource created."
      redirect_to @resource
    else
      render 'new'
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:success] = "Success! Resource has been updated"
      redirect_to @resource
    else
      render 'edit'
    end
  end

  def destroy
    Resource.find(params[:id]).destroy
    flash[:success] = "Success! Resource has been deleted"
    redirect_to resources_url
  end
  private

  def resource_params
    params.require(:resource).permit(:title, :description, :hourly_rate)
  end

  def admin_user
    redirect_to(root_url) unless logged_in? && current_user.usertype_id == 1
  end
end
