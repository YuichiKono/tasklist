class ToppagesController < ApplicationController
  def index
    if logged_in?
      @taskac = current_user.taskacs.build  # form_for 用
      @taskacs = current_user.taskacs.order('created_at DESC').page(params[:page])
    end
  end
end