class Market < ActiveRecord::Base
  belongs_to :app

  validates_presence_of :url, :app, :vendor

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
    end
    self.vendor = vendor
  end
end
