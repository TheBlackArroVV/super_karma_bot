require 'sequel'

class Messages
  def initialize
    create_db
  end

  def save_to_db_result(user_name)
    user = @users.where(user_name: user_name)

    if user.first
      user.update(count: user.first[:count] + 1)
    else
      @users.insert(user_name: user_name, count: 1)
    end
  end

  def show_all_stat
    result = []
    @users.all.each { |u| result.push(u[:user_name], u[:count]) }
    result
  end

  private

  def create_db
    @db = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

    @db.create_table? :users do
      primary_key :id
      String :user_name
      Integer :count
    end

    @users = @db[:users]
  end
end
