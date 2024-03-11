require 'sinatra'
require 'sinatra/reloader'

configure do
  enable :reloader
  set :strict_paths, false
end

def make_response(text)
  {
    result: text,
    hostname: `hostname`.strip,
    request_data: {
      headers: headers,
      body: (JSON.parse(request.body.read) rescue nil),
      params: params,
      env: request.env
    }
  }.to_json
end

get '/' do
  content_type :json
  make_response('Service One - Ruby - homepage')
end

get '/route1' do
  content_type :json
  make_response('Service One - Ruby - route 1')
end

get '/route2' do
  content_type :json
  make_response('Service One - Ruby - route 2')
end

post '/route3' do
  content_type :json
  make_response('Service One - Ruby - route 3')
end

put '/route4' do
  content_type :json
  make_response('Service One - Ruby - route 4')
end

patch '/route5' do
  content_type :json
  make_response('Service One - Ruby - route 5')
end

delete '/route6' do
  content_type :json
  make_response('Service One - Ruby - route 6')
end
