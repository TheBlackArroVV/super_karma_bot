# Super Karma Bot

### Built With:

* The Ruby language - version 2.5.0
* Postgres
* Sequel
* [Telegram API](https://core.telegram.org/bots)

### Appointment

This **Super Karma Bot** allows teammates to reward each other with karma points.
It helps building stronger and happier teams.

Bot comes with the dashboard that helps to stay on top of your team activity and visualises the stats.

### How it works:

`/all stat` - shows Karma statistic for each user.
Users ordering by Karma count(`DESC`).

`/update_user_profile` this command allows User with `admin` role updating the other User profile info.
For using this feature just put to replayed message with `/update_user_profile`

For `increasing` Karma reply for user message with `++` text. 

For `decreasing` Karma reply for user message with `--` text. 

Install
-------------
```
git clone https://github.com/TheBlackArroVV/super_karma_bot
cp .env.example .env
bundle install
rake db:migrate
bundle exec ruby main.rb
```

After install
-------------

1. Before start using that bot, you have to register your own [here](https://core.telegram.org/bots#3-how-do-i-create-a-bot).

1. **Disable** `Privacy mode` in BotFather settings for your own bot.

1. **Enable** `Groups` in BotFather settings for your own bot.

1. After [BotFather](https://core.telegram.org/bots#6-botfather) give you `token` insert  this token into `.ENV` => `TELEGRAM_TOKEN`.

1. Fill `.ENV` => `DATABASE_URL` as defined [here](https://github.com/jeremyevans/sequel#connecting-to-a-database) 
using settings for `Postgres`.

1. Add your bot to chosen Telegram Group.

Note that it takes some time for enabling Bot on Telegram Servers(about 4 hours).
