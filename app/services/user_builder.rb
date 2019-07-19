module UserBuilder
  module_function

  def call(user, karma_count)
    {}.tap do |user_hash|
      user_hash[:first_name] = user.first_name
      user_hash[:last_name] = user.last_name
      user_hash[:username] = user.username
      user_hash[:telegram_id] = user.id
      user_hash[:count] = karma_count
    end
  end
end
