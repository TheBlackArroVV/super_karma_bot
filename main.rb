require 'telegram/bot'
require_relative 'db/database'
require 'dotenv/load'
require 'byebug'
Dir[File.join(__dir__, 'config', 'initializers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app', 'services', '*.rb')].each { |file| require file }

DB = Database.new # https://github.com/jeremyevans/sequel#the-db-convention

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when INCREASEKARMA
      IncreaseKarmaService.new(message, bot).call if message.reply_to_message

    when DECREASEKARMA
      DecreaseKarmaService.new(message, bot).call if message.reply_to_message

    when GETSTAT
      KarmaService.new(message, bot).show_statistic
    end
  end
end
