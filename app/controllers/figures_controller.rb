class FiguresController < ApplicationController

  get '/figures' do
    @figures =Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure= Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
  #  binding.pry
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end


end
