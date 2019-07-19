class UpdateUserProfileService < BaseService
  def initialize(message, bot)
    @message = message
    @chat = message.chat
    @bot = bot
  end

  def update
    unless could_update_profile?
      send_fuck
      return
    end

    update_or_create_user

    send_profile_filled
  end

  private

  def update_or_create_user
    user_data = @message.reply_to_message.from

    User.update_or_create(username: user_data.username) do |user|
      user[:first_name] = user_data.first_name
      user[:last_name] = user_data.last_name
      user[:username] = user_data.username
      user[:telegram_id] = user_data.id
      user[:count] = user&.count || 0
    end
  end

  def admins
    @bot.api.getChatAdministrators(chat_id: @chat.id)['result']
  end

  def could_update_profile?
    @message.reply_to_message && current_user_is_admin?
  end

  def current_user_is_admin?
    current_user = @message.from
    admins.any? { |user| user['user']['id'] == current_user.id }
  end
end
