class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tower = Tower.friendly.find(params[:tower_id])

    if current_user.subscribed_towers.include? @tower
      @report = @tower.reports.find(params[:id])
      @comment = Comment.new
      @rating = Comment.where(user: current_user, commentable: @report).where.not(notation: nil).first_or_initialize
    else
      redirect_to dashboard_path
    end
  end

  def comment
    @tower = Tower.friendly.find(params[:tower_id])

    @report = @tower.reports.find(params[:id])
    @comment = Comment.new(user: current_user, commentable: @report)
    @comment.assign_attributes(comment_params)

    if @comment.save
      redirect_to tower_report_path(@tower, @report), notice: 'Comment created'
    else
      render :show
    end
  end

  def rate
    @tower = Tower.friendly.find(params[:tower_id])

    @report = @tower.reports.find(params[:id])
    @rating = Comment.where(user: current_user, commentable: @report).where.not(notation: nil).first_or_initialize
    @rating.assign_attributes(comment_params)

    if @rating.save
      redirect_to tower_report_path(@tower, @report), notice: 'Comment created'
    else
      render :show
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user, :commentable, :content, :notation)
    end
end
