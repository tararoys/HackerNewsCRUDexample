        zoe = User.create(name: "zoe", email: "zoe@serenity.com", password: "password")
        inara = User.create(name: "inara", email: "inara@serenity.com", password: "password")

        hate_the_alliance = Post.create(title: "I hate the alliance", source: "http://wewillriseagain.com", author: zoe)
        i_said_dont = Post.create(title: "Don't come in my shuttle", source: "http://dont.com", author: inara)


        zoe_hates_alliance = Comment.create(user_id: zoe.id, post_id: hate_the_alliance.id, content: "You have a problem with your brain being missing")
        zoe_knows_ruby = Comment.create(user_id: zoe.id, post_id: i_said_dont.id, content: "You tell the captain, ambassador.")

        inara_likes_alliance_money = Comment.create(user_id: inara.id, post_id: hate_the_alliance.id, content: "Sadly, they have the money. ") 
        inara_hates_mal = Comment.create(user_id: inara.id, post_id: i_said_dont.id, content: "Why is it so hard to understand this basic rule?") #for some reason, inara's id is being defined as nil in the database
      