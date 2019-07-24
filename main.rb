require_relative 'config/application'

Telegram::Bot::Client.run(ENV.fetch('TELEGRAM_TOKEN')) do |bot|
  bot.listen do |message|
    case message.text
    when INCREASEKARMA
      IncreaseKarmaService.new(message, bot).call if message.reply_to_message

    when DECREASEKARMA
      DecreaseKarmaService.new(message, bot).call if message.reply_to_message

    when GETSTAT
      KarmaService.new(message, bot).show_statistic

    when UPDATEUSERPROFILE
      UpdateUserProfileService.new(message, bot).update
    end
  end
end
