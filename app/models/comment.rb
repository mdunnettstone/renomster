class Comment < ApplicationRecord
  belongs_to :place
  belongs_to :user
  after_create :send_comment_email

    def send_comment_email
      NotificationMailer.comment_added(self).deliver
    end
end