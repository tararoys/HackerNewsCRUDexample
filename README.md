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

#Outline for crudding

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
    -Create 
    -Read 
    -Update
    -Destroy 
