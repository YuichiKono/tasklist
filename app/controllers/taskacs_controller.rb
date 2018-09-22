class TaskacsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @taskac = current_user.taskacs.build(taskac_params)
    if @taskac.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      @taskacs = current_user.taskacs.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @taskac.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def taskac_params
    params.require(:taskac).permit(:content)
  end

  def correct_user
    @taskac = current_user.taskacs.find_by(id: params[:id])
    unless @taskac
      redirect_to root_url
    end
  end
end