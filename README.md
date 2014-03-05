#How to run this project: 

Clone down the project. The magic words to type in the terminal to make it go are: 

```bash
  bundle install
  rake db:create
  rake db:migrate
  rake db:seed
  shotgun config.ru
```

If you wish to follow the rspec commands, the magic words to run the tests are 

setup the test databse: 

```bash 
   RACK_ENV=test rake db:create
   rake db:hard_reset 
```

The rake db:hard_reset is a badly-written custom rake command I made to reboot the entire test database if I wanted to. You can take a look at the source code to see whatall it does.

Visit the webpage http://localhost:9393/ to see the app in all its glory.  Currently, it only lets you sign in and write comments on the dummy posts.


------------------------------------------------------------------------------------------------------------

Things I learned to do while making this app.

This table of contents is what I learned and approximately the order I learned them in.

#Outline for Crudding

1. User stories 
2. Wireframing
3. Behavior Flows
4. Schema Design
5. Models and Migrations
6. Basic Validations
7. Activerecord Associations 
      -Many-to-Many Relationship between users and posts (A user comments on many posts, and a post is commented on by many users) 
8.    -One to many relationship with renamed associations. 
9.User Authentication
      -Bcrypt

10. Controllers-View pieces
      Has up to three parts: 
      - one gets controller
      - one erb view
      -one post controller

11. controller pieces: 
    - Create 
    - Read 
    - Update
    - Destroy 


Outline of things I needed to learn in order to crud
1. Github 
2. How to get along with people
3. How to break a problem into smaller parts
4. How to set strong boundaries so that people would give me the space I need to learn. 
5. How to love the tests and hate feeling pressured to 'skip the tests and just get it done.'

6. The tester's creed: "NEVER AGAIN shall anyone have to suffer as I have suffered at the hands of this bug." 



# User stories 
  - The problem: "I don't have time to write a user story: I need to get coding!"
  - The counter: "The easiest code to change is the code you haven't written yet."
  - [Remember associations nightmare? Yeah. user stories fixed it.](https://github.com/tararoys/HackerNewsCRUDexample/commit/a970f6b95394fb5de4fe17c88fdd8876ad60baaf)

# Wireframing
# Behavior Flows
# Schema Design
# Models and Migrations
# Basic Validations
# Activerecord Associations 
      -Many-to-Many Relationship between users and posts (A user comments on many posts, and a post is commented on by many users) 
#    -One to many relationship with renamed associations. 
# User Authentication
      -Bcrypt

# Controllers-View pieces
      Has up to three parts: 
      - one gets controller
      - one erb view
      -one post controller

# controller pieces: 
    - Create 
    - Read 
    - Update
    - Destroy 