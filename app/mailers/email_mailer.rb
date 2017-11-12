class EmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_mailer.new_email.subject
  #
  def new_email(email)
    @email=email
    @hotel=@email.hotel
    @user=@email.user

    mail to: @hotel.email,
         subject: "New mail for Hotel '#{@hotel.hotel_name}'"
  end
end
