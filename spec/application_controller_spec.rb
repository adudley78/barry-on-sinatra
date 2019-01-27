require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Hello, my name is Barry! I'm going to revolutionize the way news is collected, created, and delivered!")
  end
end
