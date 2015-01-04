class AppsController < ApplicationController
  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      redirect_to @app
    else
      render 'new'
    end
  end

  def show
    @app = App.find(params[:id])
  end

  private
  def app_params
    params.require(:app).permit(:links)
  end
end
