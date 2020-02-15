class ContactMailer < ApplicationMailer

  def email_user(first_name, last_name, email, message)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @message = message

    mail to: @email, message: "メッセージが送信されました"

  end

end
