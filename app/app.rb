ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require './app/models/link'
# require './app/models/tag'
require_relative 'models/data_mapper_setup'


class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session['user_id'])
    end
  end

  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split(" ").each { |tag_name| link.tags << Tag.create(name: tag_name) }
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

  get '/new' do
    erb :'signup/new'
  end

  post '/signup' do
    user = User.new(email: params[:email], password: params[:password])
    user.save
    session['user_id'] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
