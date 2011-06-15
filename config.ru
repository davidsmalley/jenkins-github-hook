require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra'
require 'net/http'
require 'jenkins_github_hook.rb'
run Sinatra::Application

