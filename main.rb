require 'telegram/bot'
require_relative 'messages'

db = Messages.new

token = '649271734:AAGeC6IwUFARpqwy41Mv-QgR7WYyqdHH22M'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '++'
      if message.reply_to_message
        bot.api.sendMessage(
          chat_id: message.chat.id,
          text: "@#{message.reply_to_message.from.username} karma growth"
        )
        db.save_to_db_result(message.reply_to_message.from.username)
      end

    when '--'
      if message.reply_to_message
        bot.api.sendMessage(
          chat_id: message.chat.id,
          text: "@#{message.reply_to_message.from.username} karma decrease"
        )
        db.decrease_karma(message.reply_to_message.from.username)
      end

    when '/all_stat'
      bot.api.sendMessage(chat_id: message.chat.id, text: db.show_all_stat.to_json)
    end
  end
end
