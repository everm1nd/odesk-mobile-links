require 'rails_helper'

describe AppsController do
  it "renders new" do
    get :new
    expect(response).to render_template(:new)
  end
end
