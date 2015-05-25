class ProjectsController < ApplicationController

  def index
    @day = params[:day]
    # ?????
    @projects = Project.joins(:project_date).merge(ProjectDate.where(date: @day))
  end

  def show
    @project = Project.find(params[:id])
  end

end
