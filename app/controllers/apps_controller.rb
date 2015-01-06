class AppsController < ApplicationController
  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      redirect_to edit_app_path(@app)
    else
      render :new
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    @app.update(app_params)
    render :edit
  end

  private
  def app_params
    params.require(:app).permit(:links, :hashid)
  end
end
