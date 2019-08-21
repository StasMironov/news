module UsersHelper
    def gravatar_for(user, options = {size: 80})
        size = options[:size]
        image_tag("rails.png", alt: "Test", class: "gravatar")
    end

     def set_user(user)
            @user = User.find(user)
            return @name = @user.name
     end
end
