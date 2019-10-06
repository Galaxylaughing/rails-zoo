# Rails Zoo
In this project, you will create a new rails application to track the animals in your Rails Zoo!

You will practice the Rails basics in a new context. To keep the requirements manageable, this application will cover only the **CR** pieces of **CRUD**. This is an individual Stage 2 project.

Each requirements section of this assignment has three sections: **think, create and verify**.
- Use the **think** section to look up and test your recall on these topics. Each answer is directly relevant to the steps you need to execute in the **create** section.
- The **create** section contains what you would see in a "normal" project's requirements.
- The **verify** section contains the steps to verify your work in the **create** section. This gives you a moment to double check your work before moving on to the next requirement.



## Setup
1. Fork and clone this project
2. Create a new rails application _within this folder_ using  `rails new .`

## Primary Requirements
### Create Controller & Model
**Think**:
- What Rails CLI command do we use to generate a new controller? Are controllers supposed to be singular or plural?
- What Rails CLI command do we use to generate a new model? Are models supposed to be singular or plural? Where do we put the fields in the migration?

**Create**:
1. a rails controller with the name `animals`
1. a new model (migration) with the name `animal`
    - each animal shall have a `name`, `species` and an `age` (add any other fields you want to track about the animals)
    - i.e. Georgia is a Lion  who is 4 years old
    - `$ rails generate model animal name:string species:string age:integer`
1. create the schema from the migration by running `rails db:migrate`

**Verify**:
1. Check the `schema.rb` file and ensure all fields you expect are in the animals table
    - if they are not, you may need to create another migration
1. Run the `rails console` from the command line and create a few new animals and save them to the database. These animals will be used in the next set of requirements

### View All Animals
**Think**:
- Which route (including controller#action) do you use for viewing _all_ of a given resource?
- Which _model method_ do you use to retrieve _every item_ from the database?

**Create**:
1. the route
1. the controller action which will retrieve all animals from the database
1. the view containing HTML & ERB to see all animal data

**Verify**:
1. http://localhost:3000/animals should show a list of all animals in the database that you added in the `rails console` from the previous section


### View One Animal
**Think**:
- Which route (including controller#action) do you use for viewing a _single_ resource?
- Which _model method_ do you use to retrieve a _single_ item from the database?

**Create**:
1. the route (including the param)
1. the controller action which will retrieve one specific animal from the database
1. the view containing HTML & ERB to see a single animal details
    - you can use [lorem pixel](http://lorempixel.com) to get animal images if you'd like to include a random photo for each animal
1. add a link to the list of animals which will take you to each animals details page

**Verify**:
1. http://localhost:3000/animals will now include links for each animal's detail page
1. http://localhost:3000/animals/1 should show you the details of one specific animal (assuming you have an animal in the database with an ID of 1)

### Create an Animal
**Think**:
- Which **routes** (including controller#action) do you use for creating a new resource? What is the purpose of each route and how do they work together to complete the whole action?
- Which _model methods_ do you use to create and save a new item to the database?

**Create**:
1. the routes
1. a link on the home page to create a new animal
1. the controller action for the first route which renders the form
1. the view to render the form
1. the controller action for the second route which saves the form database
1. the special controller method for utilizing strong parameters

**Verify**:
1. http://localhost:3000/animals should contain a button to create a new animal
1. http://localhost:3000/animals/new should show the new animal form
1. submitting the new animal form should save an animal to the database and show the full list, including the new animal on http://localhost:3000/animals



## Optional
- Complete the edit/update action
- Complete the delete action
- Add an image field to the model for an Animal
  - this field will store the location of an image on the internet and be used to display the image on the animal's show page
