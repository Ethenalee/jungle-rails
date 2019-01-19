class UserMailerPreview < ActionMailer::Preview
  # usermailer preview page  http://localhost:3000/rails/mailers/user_mailer/order_email
  def order_email
    UserMailer.order_email(User.first, Order.first)
  end
end