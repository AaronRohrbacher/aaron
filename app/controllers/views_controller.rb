class ViewsController < ApplicationController
  def destroy
    @view = View.find(params[:id])
    @view.destroy
  end
end
