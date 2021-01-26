
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @id = params[:id]

    erb :show
  end


  post '/articles' do
    @new = Article.find_or_create_by(title: params[:articles][:title], content: params[:articles][:content])
    redirect "/articles/#{@new.id}"
  end

  get '/articles/:id/edit' do
    @id = params[:id]
    @article = Article.find(@id)
    @title = @article.title
    @content = @article.content

    erb :edit
  end

  patch '/articles/:id' do

    @article2 = Article.all.last
    @article2.title = params[:articles][:title]
    @article2.content = params[:articles][:content]
    @article2.save
  

    redirect "/articles/#{@article2.id}"
    
  end

  delete "/articles/:id" do
    @article3 = Article.all.last.delete
    redirect "/articles"
  end
end
