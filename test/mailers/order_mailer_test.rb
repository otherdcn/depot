require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:two))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Dear Dave Thomas\r\n\r\nThank you for your recent order fro the Pragmatic Store.\r\n\r\nYou ordered the following items:\r\n\r\nWe'll send you a separate email when your order ships.\r\n\r\n", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:two))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <style>\r\n      /* Email styles need to be inline */\r\n    </style>\r\n  </head>\r\n\r\n  <body>\r\n    <h1>Pragmatic Order Shipped</h1>\r\n\r\n<p>\r\n  This is just to let you know that we've shipped your recent order:\r\n</p>\r\n\r\n<table>\r\n  <tr><th colspan=\"2\">Qty</th><th>Description</th></tr>\r\n  </table>\r\n\r\n  </body>\r\n</html>\r\n", mail.body.encoded
  end

end
