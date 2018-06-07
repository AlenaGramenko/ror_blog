class ApplicationMailer < ActionMailer::Base
  default from: 'admin@myblog.blog'
  layout 'mailer'
end
