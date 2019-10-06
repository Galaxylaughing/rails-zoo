require "test_helper"

describe AnimalsController do
  let(:animal) {
    Animal.create(name: "Ivy", species: "Wildcat", age: 7)
  }
  
  describe "index" do
    it "gets the index path" do
      get animals_path
      must_respond_with :success
    end
  end
  
  describe "show" do
    it "gets the show path" do
      get animal_path(animal.id)
      must_respond_with :success
    end
    
    it "redirects to index for nonexistent animals" do
      get animal_path(-1)
      must_redirect_to animals_path
    end
  end
  
end
