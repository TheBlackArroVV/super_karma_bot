require 'sequel'

class Database
  def initialize
    @db = Sequel.connect(DATABASE_URL)

    @users = @db[:users]
  end

  def increase_karma(user_data, chat_id)
    user = users.where(username: user_data.username, chat_id: chat_id)

    if user.first
      update_user_karma_counter(user, user.first[:count] + 1)
    else
      create_user(user_data, 1, chat_id)
    end
  end

  def decrease_karma(user_data, chat_id)
    user = users.where(username: user_data.username, chat_id: chat_id)

    if user.first
      update_user_karma_counter(user, user.first[:count] - 1)
    else
      create_user(user_data, 0, chat_id)
    end
  end


  def users
    @db[:users].reverse_order(:count)
  end

  def count_grouped_users(chat_id)
    users
      .where(chat_id: chat_id)
      .to_a
      .group_by { |user| user[:count] }
  end

  private

  def create_user(user_data, karma_count = 0, chat_id)
    users.insert(UserBuilder.call(user_data, karma_count, chat_id))
  end

  def update_user_karma_counter(user, new_count)
    user.update(count: new_count)
  end
end
