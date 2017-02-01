class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks' do
    binding.pry
    @landmark = Landmark.create(name: ["new_landmark"])
  end

end
