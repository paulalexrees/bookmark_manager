ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require './app/models/link'
# require './app/models/tag'
require_relative 'models/data_mapper_setup'


class Bookmark < Sinatra::Base

  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    LinkTag.create(:link => link, :tag => tag)
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/links/tags' do
    @tags = Tag.all
    erb :'links/tags'
  end

  get '/tags/search' do
    @filter = "search"
    @tags = Tag.all
    erb :'tags/filtered'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
