class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_url, notice: "#{activity_title(@activity)} was successfully created."
    else
      @activities = Activity.all
      render :index
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_url, notice: "#{activity_title(@activity)} was successfully destroyed."
  end

  def activity_title(activity)
    name = activity.try(:title)
    name = 'Activity' if name.blank?
    name
  end

  helper_method :activity_title

  protected

  def activity_params
    params.require(:activity).permit(:title, :day, :compass_install, :compass_primary_key)
  end

end