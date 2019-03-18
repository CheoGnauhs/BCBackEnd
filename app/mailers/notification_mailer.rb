class NotificationMailer < ApplicationMailer
  def comment_notification(receiver, comment, host)
    @receiver = receiver
    @comment  = comment
    @item     = comment.item
    @host     = host
    mail(from: Rails.application.config.action_mailer.smtp_settings[:user_name],
         to: @receiver.email, subject: '浣熊 - 新评论提醒')
  end

  def order_notification(receiver, order)
    @receiver = receiver
    @order    = order
    @item     = order.item
    @buyer    = order.user
    mail(from: Rails.application.config.action_mailer.smtp_settings[:user_name],
         to: @receiver.email, subject: '浣熊 - 商品购买提醒')
  end
end
