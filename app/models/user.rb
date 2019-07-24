class User < Sequel::Model(:users)
  plugin :update_or_create

  class << self
    def count_grouped_users
      User
        .reverse_order(:count)
        .to_a
        .group_by { |user| user[:count] }
    end

    def increase_karma(user_data)
      user = User.find(username: user_data.username)

      if user
        update_user_karma_counter(user, user[:count] + 1)
      else
        create_user(user_data, 1)
      end
    end

    def decrease_karma(user_data)
      user = User.find(username: user_data.username)

      if user
        update_user_karma_counter(user, user[:count] - 1)
      else
        create_user(user_data)
      end
    end

    private

    def create_user(user_data, karma_count = 0)
      User.create(UserBuilder.call(user_data, karma_count))
    end

    def update_user_karma_counter(user, new_count)
      user.update(count: new_count)
    end
  end
end
