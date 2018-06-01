namespace :tables_fill do
  desc "Set text data for users, posts and comments tables"
  task set_text_data: :environment do
    #fill users
    users_name = ["Anna", "Gallina", "Ivan", "Alex", "Leon", "Sergey", "Alena", "Polina", "Vlad", "Vasiliy"]
    50.times do |i|
      u_name = "#{users_name[rand(10)]}_#{i}"
      u_email = "#{u_name}@test.com"
      u = User.new(name: u_name, email: u_email)
      if u.save
        p u
      else
        p "Users ERROR!!! #{u}"
      end
    end
    
    test_post_body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    user_count = User.count
    
    #fill posts
    10.times do
      user = User.find(rand(user_count) + 1)
      if user
        post = Post.new(title: "#{user.name}_test_post_#{rand(100)}", body: test_post_body, user_id: user.id, visible: true)
        if post.save
          user.creator = true
          user.save
          p post
        else
          p "Posts ERROR!!! #{post}"
        end
      end
    end
    
    #fill comments:
    posts_count = Post.count
    10.times do
      user = User.find(rand(user_count) + 1)
      post = Post.find(rand(posts_count) + 1)
      if user && post
        comment = Comment.new(body: "Test comment from #{user.name} for post: #{post.title}", post_id: post.id, user_id: user.id, visible: true)
        if comment.save
          p comment
        else
          p "Comments ERROR!!! #{comment}"
        end
      end
    end
    
  end
end