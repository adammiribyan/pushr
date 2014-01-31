class Pushr < Sinatra::Base
  configure do
    set :server, :thin
    set :environment, :development
  end

  get "/" do
    if request.xhr?
      content_type :json
      {
        container: "div.container",
        title: "Pushr",
        content: "<h1>Pushr</h1>",
        url: "/"
      }.to_json
    else
      erb :index
    end
  end

  get "/loyalty" do
    if request.xhr?
      content_type :json
      {
        container: "div.container",
        title: "Gain Your Customers' Loyalty",
        content: "<h1>Loyalty</h1>",
        url: "/loyalty"
      }.to_json
    else
      erb :loyalty
    end
  end
end
