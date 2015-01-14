class Market < ActiveRecord::Base
  #TODO: shouldn't we use a strategy patterng here?

  belongs_to :app

  validates_presence_of :url, :app, :vendor

  def initialize(*args)
    super(*args)
    classify_url
    httpfy_url
  end

  def affiliate_url
    case vendor
      when 'apple'
        georiot_url(self.url)
      else
        self.url
    end
  end

  private
  def classify_url
    vendor = case url
    when /(^https?:\/\/)?(www.)?facebook.com\/games\/\S+/
        "facebook"
      when /(^https?:\/\/)?apps.facebook.com\/\S+/
        "facebook"
      when /(^https?:\/\/)?itunes.apple.com\/[a-zA-Z\-\_]*\/?app\/\S+/
        "apple"
      when /(^https?:\/\/)?play.google.com\/store\/apps\/details\?id=\S+/
        "google"
      when /(^https?:\/\/)?(www.)?windowsphone.com\/[a-zA-Z\-\_]+\/\S+/
        "microsoft"
      when /(^https?:\/\/)?(www.)?amazon(\.[a-z]+)+\/[a-zA-Z\-\_]+\/dp\/\S+/
        "amazon"
    end
    self.vendor = vendor
  end

  def httpfy_url
    self.url = 'http://' + self.url unless url =~ /^https?:\/\//
  end

  def georiot_url(url)
    georiot_id = 6554
    "http://target.georiot.com/Proxy.ashx?tsid=#{georiot_id}&GR_URL=#{URI.encode(url,/\W/)}"
  end
end
