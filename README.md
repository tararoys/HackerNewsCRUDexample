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
  - The problem: This app is easy.  I don't have to wireframe it. I need to get coding!" 
  - The counter: [Remember how bad you did on that last assesment? Proper Wireframing Prevents Panic.](https://github.com/tararoys/phase-2-assessment)

# Behavior Flows
  - The problem...actually I don't have a problem convincing myself to do behavior flows. 
  - [all right, have fun.  Make sure to adequately timebox yourself.](https://github.com/tararoys/Sinatra-Skills)

# Schema Design
  - The problem: I already know how this database works.  I don't need to draw it out! 
  - The counter:   - [Remember how drawing out the schema helped you and Ryan find and fix this issue? ](https://github.com/tararoys/HackerNewsCRUDexample/commit/1bd4ee69fd99658a0854c5b3cfc879fa296b8e3e)

# Models and Migrations
  - [how do I set up migrations on the command line?](https://github.com/tararoys/basic_crud#migrations)
  - [how do I set up models on the command line?](https://github.com/tararoys/basic_crud/#rakegeneratemodel)
  - [a basic migration with indexes and constraints](https://github.com/tararoys/HackerNewsCRUDexample/blob/5d45968d04a20f704a9059c12911a5bf69b3cffe/db/migrate/20140226092539_create_users.rb)

# Basic Validations
  - [How do I validate that an e-mail is true?](https://github.com/tararoys/HackerNewsCRUDexample/commit/eea00100d8b7d84b8c06049ac71336b9456bab13)
  - [How do I validate an e-mail format?](https://github.com/tararoys/HackerNewsCRUDexample/commit/64d92f01a91ea5a8e60290fdf6dca905a7d08201)

# Activerecord Associations 
      - [Many-to-Many Relationship between users and posts (A user comments on many posts, and a post is commented on by many users)](https://github.com/tararoys/ActiveRecord_Associations_Drill_Skeleton)
      - [Here's a join table](https://github.com/tararoys/HackerNewsCRUDexample/commit/52def5758b94ca22467639bb66af69df27922ba1) 

      - [One to many relationship with renamed associations.](https://github.com/tararoys/HackerNewsCRUDexample/commit/1bd4ee69fd99658a0854c5b3cfc879fa296b8e3e)

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