class ProjectsController < ApplicationController

  # app/views/layout/application.html.slimをレイアウトファイルとして使う
  layout "application"

  def index
    #️ ここにtomorrowとthe day afterどっちをクリックしたかをわけるif文を入れよ

    @projects = Project.where(date: 0)
  end

end
