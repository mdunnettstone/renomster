class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  after_create :send_comment_added_email

  def send_comment_added_email
    NotificationMailer.comment_added(self).deliver
  end
end
