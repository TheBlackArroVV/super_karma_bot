class BaseService
  private

  def send_fuck
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: '🖕'
    )
  end

  def send_profile_filled
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: 'Done, user profile successfully filled!'
    )
  end

  def send_karma_increase(message_text)
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: message_text
    )
  end

  def send_karma_decrease(message_text)
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: message_text
    )
  end
end
