class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  
  def show
    animal_id = params[:id]
    @animal = Animal.find_by(id: animal_id)
  end
end
