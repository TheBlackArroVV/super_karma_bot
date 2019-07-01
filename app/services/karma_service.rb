class KarmaService
  def initialize(message, bot)
    @user = message.reply_to_message.from if message.reply_to_message
    @bot = bot
    @chat = message.chat
  end

  def show_statistic
    @bot.api.sendMessage(statistic_params)
  end

  private

  def statistic_params
    {
      chat_id: @chat.id,
      text: statistic_message
    }
  end

  def statistic_message
    medals = %w[🥇 🥈 🥉]
    result = '🏆This is the karma champions list🏆'
    DB.users.each { |user| result << user_statistic(user, medals) }
    result
  end

  def username(user)
    user[:user_name] || 'null'
  end

  def user_statistic(user, medals)
    "\n#{medals.shift} #{username(user)}: #{user[:count]}"
  end
end
