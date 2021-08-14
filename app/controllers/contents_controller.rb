class ContentsController < ApplicationController
  def index
  end

  private
  def content_params
    params.require(:content).permit(:name, :price, :image).merge(user_id: current_user.id)
  end
end
