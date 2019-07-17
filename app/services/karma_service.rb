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
      text: statistic_message,
      parse_mode: 'HTML'
    }
  end

  def statistic_message
    <<~STRING
      <b>🏆This is the karma champions list</b>🏆
      <pre>------------------------------
      #{user_statistic}
      ------------------------------
      </pre>
    STRING
  end

  def username(username)
    name = username || 'null'
    until name.length == 20 do name += ' ' end
    name
  end

  def user_statistic
    medals = %w[🥇 🥈 🥉]
    ''.yield_self do |result|
      DB.count_grouped_users(@chat.id)
        .each_value
        .with_index do |stat, index|
          stat.each { |stat_group| result << user_stat(stat_group, medals[index]) }
        end
      result.strip
    end
  end

  def user_stat(user, medal)
    "#{medal(medal)} #{username(user[:username])} #{user_karma(user[:count])}\n"
  end

  def medal(medal)
    medal ||= '  '
    "|#{medal}|"
  end

  def user_karma(count)
    karma = count.to_s || ' '
    "|#{karma[0..4]}|"
  end
end
