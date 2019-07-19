require_relative 'karma_service'

class DecreaseKarmaService < KarmaService
  def call
    User.decrease_karma(@user)

    send_karma_decrease(message_text)
  end

  private

  def message_text
    "@#{@user.username} karma decrease"
  end
end
