class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    Game.all.order(:title).limit(10).to_json
  end

  get '/games/:id' do
    Game.find(params[:id]).to_json(only: [:id, :title, :genre, :price], include: {reviews: {only:[:comment, :score], include: {user: {only: [:name]}}}})
  end

end
