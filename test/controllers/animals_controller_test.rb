require "test_helper"

describe AnimalsController do
  
  describe "index" do
    
    it "gets the index path" do
      get animals_path
      must_respond_with :success
    end
    
  end
  
end
