class AdminMailer < ActionMailer::Base
  include Resque::Mailer
  default from: "blog_admin@nird.us"

  def new_post(post)
    @post = post
    mail(to: 'renee@nird.us', subject: 'New POST!!')
  end
end
