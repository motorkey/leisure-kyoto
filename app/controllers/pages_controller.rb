# coding: utf-8

class PagesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  def index 
  end
  def show
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end
end
