require 'telegram/bot'
require_relative 'messages'

db = Messages.new

token = '649271734:AAGeC6IwUFARpqwy41Mv-QgR7WYyqdHH22M'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    pp message.text
    case message.text
    when '++'
      if message.reply_to_message
        pp 'here'
        bot.api.sendMessage(
          chat_id: message.chat.id,
          reply_to_message_id: message.message_id,
          text: "@#{message.reply_to_message.from.username} karma growth"
        )
        db.save_to_db_result(message.reply_to_message.from.username)
      end

    when '/all_stat'
      bot.api.sendMessage(chat_id: message.chat.id, text: db.show_all_stat.to_json)
    end
  end
end
