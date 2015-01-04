require 'rails_helper'

describe App do
  it "accepts :links= attribute" do
    expect(App.new).to respond_to(:links=)
  end
end
