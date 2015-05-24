class ProjectsController < ApplicationController

  def index
    #️ ここにtomorrowとthe day afterどっちをクリックしたかをわけるif文を入れよ

    @projects = Project.dates.where(date: 2015/6/15)
  end

  def show
    @project = Project.find(params[:id])
  end

end
