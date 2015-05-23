class ProjectsController < ApplicationController

  def index
    #️ ここにtomorrowとthe day afterどっちをクリックしたかをわけるif文を入れよ

    @projects = Project.where(date: 0)
  end

end
