require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
  end

end
