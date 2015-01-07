class Market < ActiveRecord::Base
  belongs_to :app

  validates_presence_of :url, :app, :vendor

  before_save :process_apple_url, if: -> { vendor == "apple" }

  def initialize(*args)
    super(*args)
    classify_url
  end

  private
  def classify_url
    vendor = case url
      when /^https?:\/\/(www.)?facebook.com\/games\/\S+/
        "facebook"
      when /^https?:\/\/apps.facebook.com\/\S+/
        "facebook"
      when /^https?:\/\/itunes.apple.com\/[a-zA-Z\-\_]+\/app\/\S+/
        "apple"
      when /^https?:\/\/play.google.com\/store\/apps\/details\?id=\S+/
        "google"
      when /^https?:\/\/(www.)?windowsphone.com\/[a-zA-Z\-\_]+\/\S+/
        "microsoft"
      when /^https?:\/\/(www.)?amazon.com\/[a-zA-Z\-\_]+\/dp\/\S+/
        "amazon"
    end
    self.vendor = vendor
  end

  def process_apple_url
    georiot_id = 5
    self.url = "http://target.georiot.com/Proxy.ashx?tsid=#{georiot_id}&GR_URL=#{URI.encode(self.url,/\W/)}"
  end
end
