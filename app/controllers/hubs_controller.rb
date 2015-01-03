class HubsController < ApplicationController
  def new
    @hub = Hub.new
  end

  def create
    @hub = Hub.new(hub_params)
    if @hub.save
      redirect_to @hub
    else
      render 'new'
    end
  end

  def show
    @hub = Hub.find(params[:id])
  end

  def index
  end

  private
  def hub_params
    params.require(:hub).permit(:links)
  end
end
