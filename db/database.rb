require 'sequel'

class Database
  def initialize
    @db = Sequel.connect(DATABASE_URL)

    @users = @db[:users]
  end

  def increase_karma(user_data)
    user = users.where(username: user_data.username)

    if user.first
      update_user_karma_counter(user, user.first[:count] + 1)
    else
      create_user(user_data, 1)
    end
  end

  def decrease_karma(user_data)
    user = users.where(username: user_data.username)

    if user.first
      update_user_karma_counter(user, user.first[:count] - 1)
    else
      create_user(user_data)
    end
  end

  def users
    @db[:users].reverse_order(:count)
  end

  def count_grouped_users
    users
      .to_a
      .group_by { |user| user[:count] }
  end

  private

  def create_user(user_data, karma_count = 0)
    users.insert(UserBuilder.call(user_data, karma_count))
  end

  def update_user_karma_counter(user, new_count)
    user.update(count: new_count)
  end
end
