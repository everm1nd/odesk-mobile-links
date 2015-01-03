require 'rails_helper'

describe Hub do
  it "accepts :links= attribute" do
    expect(Hub.new).to respond_to(:links=)
  end
end