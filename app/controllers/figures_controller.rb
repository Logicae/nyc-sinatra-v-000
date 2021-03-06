class FiguresController<ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure_name"])
    if !params["new_landmark"].empty?
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end
    if !params["new_title"].empty?
      @figure.titles << Title.create(name: params["new_title"])
    end
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].collect do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].collect do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
      end
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params["figure_name"])
    if !params["new_title"].empty?
      @figure.titles << Title.create(name: params["new_title"])
    end
    if !params["new_landmark"].empty?
      @figure.landmarks << Landmark.create(name: params["new_landmark"])
    end
    if !params["figure"]["title_ids"].empty?
      params["figure"]["title_ids"].collect do |id|
        title = Title.find(id)
        @figure.titles << title
      end
    end
    if !params["figure"]["landmark_ids"].empty?
      params["figure"]["landmark_ids"].collect do |id|
        landmark = Landmark.find(id)
        @figure.landmarks << landmark
      end
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
