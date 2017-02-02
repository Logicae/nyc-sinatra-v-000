class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: ["new_landmark"], year_completed: ["year_completed"])
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["name"])
    @landmark.update(year_completed: params["year_completed"])
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end
end
