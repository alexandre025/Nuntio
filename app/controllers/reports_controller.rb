class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tower = Tower.friendly.find(params[:tower_id])

    if current_user.subscribed_towers.include? @tower
      @report = @tower.reports.find(params[:id])
      @comment = @report.comments.new
    else
      redirect_to dashboard_path
    end
  end

  def comment
    @tower = Tower.friendly.find(params[:tower_id])

    @report = tower.reports.find(params[:id])
    @comment = tower.comments.new(comment_params)
    if @comment.save
      redirect_to tower_report(tower, @report), notice: 'Comment created'
    else
      render :show
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
