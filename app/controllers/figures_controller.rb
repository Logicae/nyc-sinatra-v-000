require 'pry'
class FiguresController<ApplicationController

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure_name"])
    
    if !Title.find_by_name(params["new_title"])
      title = Title.create(name: params["new_title"])
      @figure.titles << title
    else
      title = find_by_name(params["new_title"])
      @figure.titles << title
    end

  end

end
