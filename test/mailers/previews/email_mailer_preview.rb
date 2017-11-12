# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_mailer/new_email
  def new_email
    EmailMailer.new_email
  end

end
