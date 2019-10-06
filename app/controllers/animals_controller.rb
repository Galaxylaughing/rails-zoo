class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  
  def show
    animal_id = params[:id]
    @animal = Animal.find_by(id: animal_id)
    
    if @animal.nil?
      redirect_to animals_path, flash: { error: "Could not find animal with id: #{animal_id}" }
      return
    end
  end
  
  def new
  end
end
