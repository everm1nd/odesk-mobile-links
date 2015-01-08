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

  def show
    @app = App.find(params[:id])
  end

  def shortlink
    @app = App.find_by_hashid(params[:hashid])
    if @app.markets.count > 1
      vendor = identify_device_vendor
      market = @app.markets.find_by_vendor(vendor)
      if market
        redirect_to market.url
      else
        render :show
      end
    else
      redirect_to @app.markets.first.url
    end
  end

  private
  def app_params
    params.require(:app).permit(:links, :hashid)
  end

  def identify_device_vendor
    case request.user_agent
    when /iPhone|iPad/i
      "apple"
    when /KFOT|KFTT|KFJWI|KFJWA|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|KFARWI|KFASWI|KFSAWI|KFSAWA|SD4930UR/
      "amazon"
    when /Android/i
      "google"
    when /Windows Phone/i
      "microsoft"
    else
      "facebook"
    end
  end
end
