class ContentsController < ApplicationController

  before_action :find_action ,only: [:edit, :update, :destroy]
  before_action :move_to_index ,only: [:edit, :update, :destroy]

  def index
    @content = Content.where(user: current_user)
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

  private
  def content_params
    params.require(:content).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

  def find_action
    @content = Content.find(params[:id])
  end

  def move_to_index
    unless current_user == @content.user
      redirect_to root_path
    end
  end
  
end
