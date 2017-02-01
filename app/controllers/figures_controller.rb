require 'pry'
class FiguresController<ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure_name"])

    if !params["new_title"].empty?
      @figure.titles << Title.create(name: params["new_title"])
    end
    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].collect do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end

    if !params["new_landmark"].empty?
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end
    if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].collect do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
      end
    end
    @figure.save
  end

end
