class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  
  def show
    animal_id = get_id
    @animal = find_by_id(animal_id)
    
    if @animal.nil?
      redirect_to animals_path, flash: { error: "Could not find animal with id: #{animal_id}" }
      return
    end
  end
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(animal_params)
    
    if @animal.save
      redirect_to animal_path(@animal.id)
      return
    else
      render :new
      return
    end
  end
  
  private
  
  def get_id
    return params[:id]
  end
  
  def find_by_id(id)
    animal = Animal.find_by(id: id)
    return animal
  end
  
  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end
end
