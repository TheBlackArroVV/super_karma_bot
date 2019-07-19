require_relative 'karma_service'

class IncreaseKarmaService < KarmaService
  def call
    User.increase_karma(@user)

    send_karma_increase(message_text)
  end

  private

  def message_text
    "@#{@user.username} karma growth"
  end
end
