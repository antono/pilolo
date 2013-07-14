require 'net/smtp'

msgstr = <<-EOM
Subject: hello

Email body...

EOM

Net::SMTP.start('33.33.33.10', 25) do |smtp|
  smtp.send_message(msgstr, 'self@antono.info', 'antono@pilolo')
end
