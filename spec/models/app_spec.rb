require 'rails_helper'

describe App do
  it "accepts :links= attribute" do
    expect(App.new).to respond_to(:links=)
  end

  it "creates with all types of links" do
    links = <<-eos
      https://itunes.apple.com/en/app/candy-crush-saga/id553834731?mt=8
      https://play.google.com/store/apps/details?id=com.king.candycrushsaga&hl=en
      http://www.windowsphone.com/en-us/store/app/candy-crush-saga/aebbdef8-1792-488b-a7be-7596a1720166
      https://apps.facebook.com/candycrush/
      http://www.amazon.com/King-Candy-Crush-Saga/dp/B00FAPF5U0
    eos
    @app = App.create(links: links)
    expect(@app.persisted?).to be true
  end
end
