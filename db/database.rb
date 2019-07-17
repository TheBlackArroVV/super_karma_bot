require 'sequel'

class Database
  def initialize
    @db = Sequel.connect(DATABASE_URL)

    @users = @db[:users]
  end

  def increase_karma(user_name)
    user = users.where(user_name: user_name)

    if user.first
      user.update(count: user.first[:count] + 1)
    else
      users.insert(user_name: user_name, count: 1)
    end
  end

  def decrease_karma(user_name)
    user = users.where(user_name: user_name)

    if user.first
      user.update(count: user.first[:count] - 1)
    else
      users.insert(user_name: user_name, count: 0)
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
end
