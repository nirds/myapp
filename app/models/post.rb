class Post < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id
  belongs_to :topic
  #after_create :send_new_post_email

private

  def send_new_post_email
    AdminMailer.new_post(self).deliver
    #binding.pry
  end

end
