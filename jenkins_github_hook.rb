require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra'
require 'net/http'
require 'uri'
require 'config.local.rb'

get '/' do
  "it works!"
end

post '/build_hook' do
  payload = parse_payload(params[:payload])
  http = Net::HTTP.new(config[:build_host])
  request = Net::HTTP::Post.new(build_post_uri(payload))
  response = http.request(request)
  "OK"
end

def build_post_uri(payload)
  u = URI.new(config[:build_url])
  u.query = "GITHUB_BRANCH=#{payload["ref_name"]}&GITHUB_PAYLOAD=#{payload}"
  u
end

def parse_payload(json)
  payload = JSON.parse(json)
  payload['ref_name'] = payload['ref'].to_s.sub(/\Arefs\/(heads|tags)\//, '')
  payload
end

