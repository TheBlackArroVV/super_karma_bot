require_relative 'karma_service'

class IncreaseKarmaService < KarmaService
  def call
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: message_text
    )
    DB.increase_karma(@user.username)
  end

  private

  def message_text
    "@#{@user.username} karma growth"
  end
end
