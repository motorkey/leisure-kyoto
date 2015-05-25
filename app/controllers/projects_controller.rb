class ProjectsController < ApplicationController

  def index
    #️ ここにtomorrowとthe day afterどっちをクリックしたかをわけるif文を入れよ

    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end
