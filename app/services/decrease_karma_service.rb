require_relative 'karma_service'

class DecreaseKarmaService < KarmaService
  def call
    @bot.api.sendMessage(
      chat_id: @chat.id,
      text: message_text
    )
    DB.decrease_karma(@user, @chat.id)
  end

  private

  def message_text
    "@#{@user.username} karma decrease"
  end
end
