class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_action, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @content = Content.where(user: current_user).order("#{sort_column} #{sort_direction}")
  end

  def index2
    @content = Content.where(user: current_user).order("#{sort_column} #{sort_direction}")
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  # this action will be called via ajax
  def sort
    content = Content.find(params[:content_id])
    content.update(content_params)
    render body: nil
  end

  private

  def content_params
    params.require(:content).permit(:name, :price, :image, :memo, :row_order_position).merge(user_id: current_user.id)
  end

  def find_action
    @content = Content.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @content.user
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Content.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
