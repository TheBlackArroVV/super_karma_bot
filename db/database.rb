require 'sequel'

class Database
  def initialize
    initialize_db
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

  private

  def initialize_db
    @db = Sequel.connect(DATABASE_URL)

    initialize_table

    @users = @db[:users]
  end

  def initialize_table
    @db.create_table? :users do
      primary_key :id
      String :user_name
      Integer :count
    end
  end
end
