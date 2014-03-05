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

