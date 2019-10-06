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
  
  describe "edit" do
    it "shows edit view for an existing animal" do
      get edit_animal_path(animal.id)
      must_respond_with :success
    end
    
    it "redirects for nonexisting animals" do
      get edit_animal_path(-1)
      must_redirect_to animals_path
      expect(flash[:error]).must_equal "Could not find animal with the id: -1"
    end
  end
  
  describe "update" do
    it "can update an existing animal's info" do
      animal = Animal.create(name: "Micky", species: "Turtle", age: 899)
      
      animal_hash = {
        animal: {
          name: "Michael",
          species: "turtle",
          age: 900
        }
      }
      
      existing_animal = Animal.find_by(name: animal.name)
      
      expect {
        patch animal_path(existing_animal.id), params: animal_hash
      }.wont_change 'Animal.count'
      
      updated_animal = Animal.find_by(id: existing_animal.id)
      
      expect(updated_animal.name).must_equal animal_hash[:animal][:name]
      expect(updated_animal.species).must_equal animal_hash[:animal][:species]
      expect(updated_animal.age).must_equal animal_hash[:animal][:age]
      
      must_redirect_to animal_path(updated_animal.id)
    end
    
    it "will redirect if given a nonexistent id" do
      animal_hash = {
        animal: {
          name: "Michael",
          species: "turtle",
          age: 900
        }
      }
      
      patch animal_path(-1), params: animal_hash
      
      must_redirect_to animals_path
    end
    
    it "won't update if given empty params" do
      invalid_params = {}
      
      animal_id = animal.id
      existing_animal = Animal.find_by(id: animal_id)
      
      patch animal_path(animal_id), params: invalid_params
      
      must_respond_with :bad_request
      
      updated_animal = Animal.find_by(id: existing_animal.id)
      expect(updated_animal.name).must_equal existing_animal.name
      expect(updated_animal.species).must_equal existing_animal.species
      expect(updated_animal.age).must_equal existing_animal.age
    end
    
    it "won't update if given invalid params" do
      invalid_params = {
        animal: {
          woof: "woof"
        }
      }
      
      animal_id = animal.id
      existing_animal = Animal.find_by(id: animal_id)
      
      patch animal_path(animal_id), params: invalid_params
      
      must_respond_with :bad_request
      
      updated_animal = Animal.find_by(id: existing_animal.id)
      expect(updated_animal.name).must_equal existing_animal.name
      expect(updated_animal.species).must_equal existing_animal.species
      expect(updated_animal.age).must_equal existing_animal.age
    end
  end
  
end
