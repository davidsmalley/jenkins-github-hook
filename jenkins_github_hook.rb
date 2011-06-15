require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra'
require 'net/http'

require 'config.local.rb'

get '/' do
  "it works!"
end

post '/build_hook' do
  payload = parse_payload(params[:payload])
  if config[:build_branches].include?(payload["ref_name"])
    http = Net::HTTP.new(config[:build_host])
    request = Net::HTTP::Post.new(config[:build_uri])
    response = http.request(request)
  end
  "OK"
end

def parse_payload(json)
  payload = JSON.parse(json)
  payload['ref_name'] = payload['ref'].to_s.sub(/\Arefs\/(heads|tags)\//, '')
  payload
end

