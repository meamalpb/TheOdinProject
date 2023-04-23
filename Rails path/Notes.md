# What is rails

Rails is opinionated software. It makes the assumption that there is a "best" way to do things, and it's designed to encourage that way - and in some cases to discourage alternatives. If you learn "The Rails Way" you'll probably discover a tremendous increase in productivity. If you persist in bringing old habits from other languages to your Rails development, and trying to use patterns you learned elsewhere, you may have a less happy experience.

# Creating a new rails app
`rails new my_first_rails_app`

# Main philosophy
* Don't Repeat Yourself
* Convention Over Configuration

# Starting up the Web Server
```rails server```

# Say "Hello", Rails

To get Rails saying "Hello", you need to create at minimum a route, a controller with an action, and a view.

In terms of implementation: Routes are rules written in a Ruby DSL (Domain-Specific Language). Controllers are Ruby classes, and their public methods are actions. And views are templates, usually written in a mixture of HTML and Ruby.

Let's start by adding a route to our routes file, `config/routes.rb`, at the top of the `Rails.application.routes.`draw block:
```rb
Rails.application.routes.draw do
  get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

Now we'll run the **controller generator** (with the --skip-routes option because we already have an appropriate route):
`bin/rails generate controller Articles index --skip-routes`

The most important of these is the controller file, `app/controllers/articles_controller.rb`.

# Autoloading
Rails applications do not use require to load application code.
You only need require calls for two use cases:

* To load files under the lib directory.
* To load gem dependencies that have require: false in the Gemfile.

# Model
A model is a Ruby class that is used to represent data. Additionally, models can interact with the application's database through a feature of Rails called Active Record.

## Generating a model
To define a model, we will use the model generator:

`rails generate model Article title:string body:text`

Two main files are
* the migration file db/migrate/<timestamp>_create_articles.rb
* the model file app/models/article.rb.

## Database Migrations
Migrations are used to alter the structure of an application's database. In Rails applications, migrations are written in Ruby so that they can be database-agnostic.

## Using a Model to Interact with the Database
To play with our model a bit, we're going to use a feature of Rails called the console. The console is an interactive coding environment just like irb, but it also automatically loads Rails and our application code.
command : `rails console`

# Scaffold
Scaffold is the easiest way to do generate a simple rest service and it literally takes just 2 commands
Suppose you want to create a simple blog post model with a title and a body. To generate the scaffold for this model, you can use the following command:

```rb
rails generate scaffold Post title:string body:text
rails db:migrate
rails server
```

You can then visit http://localhost:3000/posts in your web browser to see the index page for the Post model. From there, you can create, edit, and delete posts using the generated views.

This command by itself produces a lot of routes , views and controllers

# Routing
when a request enters your application  Rails grabs all the parameters that came with it and makes them available for you in a special hash called params that you can later use in your controller.
for example

routes.rb
```rb
Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
end
```

articles_controller.rb
```rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
```

Usually a full crud application
```rb
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show"
  post "/posts", to: "posts#create"  # usually a submitted form
  get "/posts/:id/edit", to: "posts#edit"
  put "/posts/:id", to: "posts#update" # usually a submitted form
  delete "/posts/:id", to: "posts#destroy"
```

All these routes can be automatically made by adding this on the routes.rb file
`  resources :posts `

The above created routes need controller methods to work and the simplest controller to satisfy above routes are given below
```rb
class PostsController < ApplicationController

    def index
      # very simple code to grab all posts so they can be
      # displayed in the Index view (index.html.erb)
    end

    def show
      # very simple code to grab the proper Post so it can be
      # displayed in the Show view (show.html.erb)
    end

    def new
      # very simple code to create an empty post and send the user
      # to the New view for it (new.html.erb), which will have a
      # form for creating the post
    end

    def create
      # code to create a new post based on the parameters that
      # were submitted with the form (and are now available in the
      # params hash)
    end

    def edit
      # very simple code to find the post we want and send the
      # user to the Edit view for it (edit.html.erb), which has a
      # form for editing the post
    end

    def update
      # code to figure out which post we're trying to update, then
      # actually update the attributes of that post. Once that's
      # done, redirect us to somewhere like the Show page for that
      # post
    end

    def destroy
      # very simple code to find the post we're referring to and
      # destroy it.  Once that's done, redirect us to somewhere fun.
    end
  end
  ```

When we don't want all the routes:
```rb
  resources :posts, only: [:index, :show]
  resources :users, except: [:index]
```

Using scope, we can alter path names generated by resources:
```rb
scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
  resources :categories, path: 'kategorien'
end
```
```rb
GET	        /kategorien	categories#index	categories_path
GET	        /kategorien/neu	categories#new	new_category_path
POST	      /kategorien	categories#create	categories_path
GET	        /kategorien/:id	categories#show	category_path(:id)
GET	        /kategorien/:id/bearbeiten	categories#edit	edit_category_path(:id)
PATCH/PUT	  /kategorien/:id	categories#update	category_path(:id)
DELETE	    /kategorien/:id	categories#destroy	category_path(:id)
```

```rb
scope 'admin', as: 'admin' do
  resources :photos, :accounts
end

resources :photos, :accounts
```

This will generate routes such as `admin_photos_path` and `admin_accounts_path` which map to `/admin/photos` and `/admin/accounts` respectively.

You can prefix routes with a named parameter also:
```rb
scope ':username' do
  resources :articles
end
```
This will provide you with URLs such as /bob/articles/1 and will allow you to reference the username part of the path as params[:username] in controllers, helpers, and views.

A shortcut you’ll see plenty of times is, instead of writing `redirect_to post_path(@post.id)`, just write `redirect_to @post` because Rails knows people did that so often that they gave you the option of writing it shorthand.


# Problem with link_to
`link_to` is a method used instead of a tag in rails. This allows to add path not as prefix_path kind of way.
You can also add methods with `link_to` in the following way:
`<%= link_to 'Destroy', post, :method => :delete, :onclick => "return confirm('Are you sure you want to delete this post?')" %>`


Unfortunately this does not work. Delete method for some reason doesnt work. There is a solution to do it in previous rails version but I havent found similar article for the new version yet.
Anyway the easy thing to do is to just replace `link_to` by `button_to`.

After some days I found the solution to use `link_to` as well as delete method. Code below

`<%= link_to "Signout", destroy_user_session_path ,'data-turbo-method': :delete %>`

# Active record basics
Active Record is, to put it inelegantly, the gem that takes care of all the database stuff. It’s known as an “ORM”.

Active Record takes data which is stored in a database table using rows and columns, which needs to be modified or retrieved by writing SQL statements (if you’re using a SQL database), and it lets you interact with that data as though it was a normal Ruby object.

So if you want to get an array containing a listing of all the users, instead of writing code to initiate a connection to the database, then doing some sort of `SELECT * FROM users` query, and converting those results into an array, you can just type `User.all` and Active Record gives us that array filled with User objects that we can play with as we like

## Creating a new row in db
Active Record lets you create a Ruby object that represents a row in one of your database tables, like a User. To create a new User is a two-step process:
```rb
u = User.new(name: "Sven", email: "sven@theodinproject.com")
u.save
```
You can also do this in 1 line
```rb
u = User.create(name: "Sven", email: "sven@theodinproject.com")
```

## Migrations
After you’ve actually created the database in the first place (using $ `rails db:create`), to create that model you need to type this command :
`the $ rails generate model YourModelNameHere `
Following files are generated
```rb
  invoke  active_record
  create    db/migrate/20131223154310_create_testmodels.rb
  create    app/models/testmodel.rb
  invoke    rspec
  create      spec/models/testmodel_spec.rb
```

The model file that the generator creates is just a bare-bones model file in the `app/models` directory. The other main file is the migration file in the `db/migrate` folder, which starts with a complicated looking timestamp like `20130924230504_create_users.rb`

If you want to only create the database migration file (without the Model or any of the test files), just use ` $ rails generate migration NameYourMigration`. You’ll end up using this one more once you’ve got things up and running since you’ll probably be modifying your data table instead of creating a new one

A migration is basically a script that tells Rails how you want to set up or change a database.
Migrations are just a script, so how do you tell Rails to run that script and actually execute the code to create your table and update your database’s schema? By using the `$ rails db:migrate` command, which runs any migrations that haven’t yet been run.

The most immediately useful feature of migrations is when you’ve screwed something up because they’re (usually) reversible. Let’s say you just migrated to create a new database column but forgot a column to store the user’s email… oops! You can just type $ rails db:rollback and the last series of migrations that you ran will be reversed and you’re back to where you were. Then you just edit the file, rerun the migrations, and move on with your life.

## Rails DB Migration - How To Drop a Table?
I added a table that I thought I was going to need, but now no longer plan on using it. How should I remove that table?
Write your migration manually. E.g. `run rails g migration DropUsers`.

### BAD - running rake db:migrate and then rake db:rollback will fail

```rb
class DropUsers < ActiveRecord::Migration
  def change
    drop_table :users
  end
end
```

### GOOD - reveals intent that migration should not be reversible
```rb
class DropUsers < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
```
BETTER - is actually reversible
```rb
class DropUsers < ActiveRecord::Migration
  def change
    drop_table :users do |t|
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
```
# simple examples of generate statements and output
```rb
blog>rails g model testmodel
      invoke  active_record
      create    db/migrate/20230415015856_create_testmodels.rb
      create    app/models/testmodel.rb
      invoke    test_unit
      create      test/models/testmodel_test.rb
      create      test/fixtures/testmodels.yml

blog>rails g controller testroute
      create  app/controllers/testroute_controller.rb
      invoke  erb
      create    app/views/testroute
      invoke  test_unit
      create    test/controllers/testroute_controller_test.rb
      invoke  helper
      create    app/helpers/testroute_helper.rb
      invoke    test_unit
blog>rails g controller testroute2 index
      create  app/controllers/testroute2_controller.rb
       route  get 'testroute2/index'
      invoke  erb
      create    app/views/testroute2
      create    app/views/testroute2/index.html.erb
      invoke  test_unit
      create    test/controllers/testroute2_controller_test.rb
      invoke  helper
      create    app/helpers/testroute2_helper.rb
      invoke    test_unit

blog>rails g controller testroute3 index show edit
      create  app/controllers/testroute3_controller.rb
       route  get 'testroute3/index'
              get 'testroute3/show'
              get 'testroute3/edit'
      invoke  erb
      create    app/views/testroute3
      create    app/views/testroute3/index.html.erb
      create    app/views/testroute3/show.html.erb
      create    app/views/testroute3/edit.html.erb
      invoke  test_unit
      create    test/controllers/testroute3_controller_test.rb
      invoke  helper
      create    app/helpers/testroute3_helper.rb
      invoke    test_unit
```
## how to generate a model which belongs to another model
Consider a model issue which belongs to another model project. This is how to generate this model

`rails generate model Issue Title:string Severity:string body:text project:references`

# How to quickly use devise to set  authentication for your app
### Step 1 - Add devise to your gem file
```rb
bundle add devise
rails g devise:install
```

### Step 2 - Generate you user model
In this model, we have email,password and role you can also add other attributes like name etc
```rb
rails g model devise User role:integer
#migrate your code
rails db:migrate
```
### Step 3 - Test if devise works
You can use variables like current_user to test if devise works.
For example

```rb
<% if current_user %>
    <p>Hello <%= current_user.email %> !</p>
    You have successfully authenticated
    <%= link_to "Signout", destroy_user_session_path ,'data-turbo-method': :delete %>
<% else %>
    Not authenticated
    <%= link_to "Signup", new_user_registration_path %>
    <%= link_to "Login", new_user_session_path %>
<% end %>
```
Now you can map the integer value of role to actual roles using enums
By putting the below code in `User.rb` in `model` folder

```rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :moderator , :tester , :developer , :projectLead , :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
end
```

Now you can use methods like `current_user.developer?` to test if current user is a developer
Example given below
```rb
<h1>Pages#home</h1>
<p>Find me in app/views/pages/home.html.erb</p>
<% if current_user %>
    <p>Hello <%= current_user.email %> !</p>
    You have successfully authenticated
        <br><br>
    yoou are a <%= current_user.role %>
    <% if current_user.developer? %>
        <h1> you can see this text because of your role as a developer </h1>
    <% end%>
    <br><br>
    <%= link_to "Signout", destroy_user_session_path ,'data-turbo-method': :delete %>
<% else %>
    Not authenticated
    <%= link_to "Signup", new_user_registration_path %>
    <%= link_to "Login", new_user_session_path %>
<% end %>
```

But how does this work?

When you declare an enum on a model attribute in Rails, it generates a set of instance methods on the model that allow you to interact with the attribute more easily.

In the case of the role enum on the `User` model, Rails will generate several methods for each possible value of the enum. These methods include getter methods to check if the attribute is set to a particular value and setter methods to set the attribute to a particular value.

In this case, the `user.moderator!` method is one of the generated setter methods that Rails creates for each enum value. When you call this method on a User instance, Rails will set the role attribute of that instance to the corresponding value of `:moderator`.

Internally, Rails knows to look at the role attribute of the User model because that's where the enum is defined. The enum declaration tells Rails that the role attribute can take on six possible values, including `:moderator`. When you call user.moderator!, Rails uses this information to set the role attribute to `:moderator`.

So, when you call `user.moderator!`, you're actually calling a method that Rails generates based on the role enum declaration, and this method sets the role attribute to the corresponding value of `:moderator`.

## How to add a new attribute to your devise user model

Make a new migration like below

```rb
rails generate migration AddNameToUsers name:string
rails db:migrate
```
This will apply the changes defined in the migration file to the database and add the new name column to the users table.

Now we should add this field to the devise views
First generate views if they dont exist or are not shown in your app

```rb
rails generate devise:views
```
then add a field like this in registrations new.html.erb
```rb
  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
  </div>
```

After this paste the following code into your applications_controller

```rb
before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

  end
```
This is to permit name variable while doing new registration operation

# Delete children rows when parent row is deleted

Not stating correctly but imagine you have a parent model and children model
When parent is deleted so should the children
if u only use belongs_to and has many ,
When you delete a parent ,it shows an error

How to fix this
```rb
class Parent < ApplicationRecord
  has_many :children, dependent: :destroy
end
```
