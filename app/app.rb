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
    tag = []
    params[:tag].split(" ").each { |tag_name| link.tags << Tag.create(name: tag_name) }
    #tag = Tag.create(name: params[:tag])
    #LinkTag.create(:link => link,  :tag => tag)
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/links/tags' do
    @tags = Tag.all
    erb :'links/tags'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
