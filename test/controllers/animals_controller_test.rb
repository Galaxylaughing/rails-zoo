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
  
  describe "new" do
    it "renders the new animal form" do
      get new_animal_path
      must_respond_with :success
    end
  end
  
  describe "create" do
    it "can add a new animal to the database" do
      animal_hash = {
        animal: {
          name: "Tim",
          species: "field mouse",
          age: 1
        }
      }
      
      expect {
        post animals_path, params: animal_hash
      }.must_change 'Animal.count', 1
      
      new_animal = Animal.find_by(name: animal_hash[:animal][:name])
      expect(new_animal.species).must_equal animal_hash[:animal][:species]
      expect(new_animal.age).must_equal animal_hash[:animal][:age]
      
      must_redirect_to animal_path(new_animal.id)
    end
  end
  
end
